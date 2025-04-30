import 'dart:math';
import 'package:flutter/material.dart';

class ListeParticipantsPage extends StatefulWidget {
  @override
  _ListeParticipantsPageState createState() => _ListeParticipantsPageState();
}

class _ListeParticipantsPageState extends State<ListeParticipantsPage> {
  final List<Map<String, String>> participants = [
    {
      'name': 'Meriam jlassi',
      'position': 'CEO de Elyos Digital',
      'location': 'Meriam@gmail.com',
    },
    {
      'name': 'Asma Abid',
      'position': 'chef de projet',
      'location': 'Asma@gmail.com',
    },
    {
      'name': 'Molka Baoueb',
      'position': 'Senior Project Manager ',
      'location': 'Molkaaa@gmail.com',
    },
    {
      'name': 'Arabella Kirk',
      'position': 'CEO at Umbrella Corporation',
      'location':'arabellam@gmail.com',
    },
    {
      'name': 'ahmed Melki',
      'position': 'RH',
      'location': 'ahmed@gmail.com',
    },
    {
      'name': 'Hamdi Hichri',
      'position': 'Project Manger',
      'location': 'hamdi@gmail.com',
    },
  ];

  List<Map<String, String>> filteredParticipants = [];
  TextEditingController _searchController = TextEditingController();

  final Random _random = Random();

  // Pastel Colors for avatars
  final List<Color> _avatarColors = [
    Color(0xFFB3A7F9), // Pastel Purple
    Color(0xFFB4F2B1), // Pastel Green
    Color(0xFFFFF1B3), // Pastel Yellow
    Color(0xFFB5E0F7), // Pastel Blue
    Color(0xFFFFC1D7), // Pastel Pink
    Color(0xFFFFE8A1), // Pastel Orange
  ];

  @override
  void initState() {
    super.initState();
    filteredParticipants = participants;  // Initially display all participants
    _searchController.addListener(_filterParticipants);
  }

  void _filterParticipants() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredParticipants = participants.where((participant) {
        final name = participant['name']!.toLowerCase();
        final location = participant['location']!.toLowerCase();
        return name.contains(query) || location.contains(query);
      }).toList();
    });
  }

  String _getInitial(String name) {
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  Color _getRandomColor() {
    return _avatarColors[_random.nextInt(_avatarColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Space out the elements
          children: [
            Row(
              children: [
                Icon(Icons.people, color: Colors.black),  // The icon next to the title
                SizedBox(width: 8),  // Space between the icon and the text
                const Text(
                  'Participants',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Icon(Icons.more_vert, color: Colors.black),  // The "more" icon at the right
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Divider before the search box
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(height: 1, thickness: 1, color: Colors.grey),
          ),

          // Search Box with slight border radius and proper placeholder positioning
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 160,  // Adjust the width of the search box
                  height: 40,   // Adjust the height of the search box
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),  // Slight border radius
                    border: Border.all(color: Colors.grey, width: 0.8),  // Subtle border
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(fontSize: 14),
                      prefixIcon: const Icon(Icons.search, size: 20, color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      border: InputBorder.none,  // Removes the default border
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: filteredParticipants.isEmpty
                ? Center(child: Text("No participants found"))
                : ListView.builder(
              itemCount: filteredParticipants.length,
              itemBuilder: (context, index) {
                final participant = filteredParticipants[index];
                final name = participant['name'] ?? '';
                final position = participant['position'] ?? '';
                final location = participant['location'] ?? '';

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      leading: CircleAvatar(
                        backgroundColor: _getRandomColor(), // Random pastel color for each participant
                        radius: 22,
                        child: Text(
                          _getInitial(name),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      title: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            position,
                            style: const TextStyle(fontSize: 11, color: Colors.black54),
                          ),
                          Text(
                            location,
                            style: const TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

