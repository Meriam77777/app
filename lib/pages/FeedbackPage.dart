import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  int _rating = 0;

  Widget _buildStar(int index) {
    return IconButton(
      icon: Icon(
        index < _rating ? Icons.star : Icons.star_border,
        color: Colors.amber,
        size: 30,
      ),
      onPressed: () {
        setState(() {
          _rating = index + 1;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Ensures layout adjusts when keyboard appears
      appBar: AppBar(title: Text("Donnez votre avis")),
      body: SingleChildScrollView(  // Makes the content scrollable when keyboard appears
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Merci d'avoir pris le temps de nous faire part de vos avis, cela signifie beaucoup pour nous. Si vous avez d'autres choses à partager, veuillez les ajouter ci-dessous !",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              Text("Évaluez notre formation:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                children: List.generate(5, (index) => _buildStar(index)),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Écrivez votre avis ici...",
                ),
                maxLines: 4,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF882BD0),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Merci pour votre avis !")),
                    );
                    Navigator.pop(context);
                  },
                  child: Text("Envoyer", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
