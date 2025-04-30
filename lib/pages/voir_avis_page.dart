import 'dart:math';
import 'package:flutter/material.dart';
import 'ListeParticipantsPage.dart';
import 'detail_avis_page.dart';


class VoirAvisPage extends StatelessWidget {
  final Random _random = Random();

  int _generateRandomParticipants() {
    return _random.nextInt(7) + 15; // 15 to 21
  }

  final List<Map<String, dynamic>> formationsAvecAvis = [
    {
      "titre": "Initiation à Flutter",
      "date": "12/03/2024",
      "avis": [
        {
          "nom": "Ali Ben Salah",
          "commentaire": "je n'ai jamais suivi une formation comme le votre , merci pour l'eclaircissement.",
          "note": 5
        },
        {"nom": "Molka", "commentaire": "belle formation, merci infiniment!", "note": 4},
        {"nom": "Meriam", "commentaire": "Bravo ,Coach!", "note": 5},
      ]
    },
    {
      "titre": "Sécurité Informatique",
      "date": "10/01/2024",
      "avis": [
        {"nom": "Mohamed Gharbi", "commentaire": "Bravoo.", "note": 3},
      ]
    },
    {
      "titre": "Gestion de Projet Agile",
      "date": "20/02/2024",
      "avis": [
        {"nom": "John Doe", "commentaire": "Très utile pour la gestion d'équipe.", "note": 4},
        {"nom": "Jane Smith", "commentaire": "Des outils pratiques et efficaces.", "note": 5},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Mes Formations",
          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 8),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 1, thickness: 1, color: Colors.black12),
          Expanded(
            child: formationsAvecAvis.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
              itemCount: formationsAvecAvis.length,
              itemBuilder: (context, index) {
                final formation = formationsAvecAvis[index];
                final numberOfParticipants = _generateRandomParticipants();
                final avisList = formation['avis'] as List<dynamic>;
                final averageRating = avisList.isEmpty
                    ? 0.0
                    : avisList
                    .map((a) => a['note'] as int)
                    .reduce((a, b) => a + b) /
                    avisList.length;

                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  color: Colors.white,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailAvisPage(
                            titreFormation: formation['titre'],
                            avisList: formation['avis'],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ListeParticipantsPage(),
                                ),
                              );
                            },
                            child: const CircleAvatar(
                              backgroundColor: Color(0xFF8A2BE2),
                              child: Icon(Icons.people, color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  formation['titre'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Text(
                                      formation['date'],
                                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                                    ),
                                    const SizedBox(width: 12),
                                    Row(
                                      children: [
                                        const Icon(Icons.people, size: 16, color: Colors.grey),
                                        const SizedBox(width: 4),
                                        Text(
                                          "$numberOfParticipants",
                                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    averageRating.toStringAsFixed(1),
                                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text("Voir avis", style: TextStyle(fontSize: 12, color: Colors.grey)),
                                  SizedBox(width: 4),
                                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                                ],
                              ),
                            ],
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

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/youtube_empty.png", height: 180),
          const SizedBox(height: 16),
          const Text(
            "Partagez vos vidéos avec qui vous voulez.",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text("Créer"),
          ),
        ],
      ),
    );
  }
}




