import 'package:flutter/material.dart';
import 'package:myapp_test/pages/feedbackpage.dart';

class AvisPage extends StatelessWidget {
  final List<Map<String, String>> feedbackList = [
    {
      "name": "KaiB",
      "date": "19 Juin",
      "comment": "KaiB was amazing 🌟🌟🌟 This was our first time! Very funny and detailed reports. Highly recommended!",
      "avatar": "https://randomuser.me/api/portraits/men/1.jpg"
    },
    {
      "name": "Maria",
      "date": "20 Juin",
      "comment": "Highly recommended!",
      "avatar": "https://randomuser.me/api/portraits/women/avatar.png"
    },
    {
      "name": "John Doe",
      "date": "22 Juin",
      "comment": "Super expérience ! Je recommande fortement.",
      "avatar": "https://randomuser.me/api/portraits/men/3.jpg"
    },
    {
      "name": "Sophie L.",
      "date": "23 Juin",
      "comment": "Service au top, très satisfaite !",
      "avatar": "https://randomuser.me/api/portraits/women/4.jpg"
    },
    {
      "name": "Alex",
      "date": "24 Juin",
      "comment": "Une équipe géniale et des conseils très utiles.",
      "avatar": "https://randomuser.me/api/portraits/men/5.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avis'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end, // Aligner à droite
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FeedbackPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.add, color: Colors.black),
                        label: Text(
                          "Ajouter un feedback",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),

                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: feedbackList.length,
                  itemBuilder: (context, index) {
                    final feedback = feedbackList[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(feedback["avatar"]!),
                          ),
                          title: Text(
                            feedback["name"]!,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                feedback["date"]!,
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              SizedBox(height: 5),
                              Text(
                                feedback["comment"]!,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              5,
                                  (starIndex) => Icon(Icons.star, color: Colors.amber, size: 16),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


