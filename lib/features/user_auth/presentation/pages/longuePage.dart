import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/MyDrawer/mydrawer.dart';

class LonguePage extends StatefulWidget {
  @override
  _LonguePageState createState() => _LonguePageState();
}

class _LonguePageState extends State<LonguePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _francaisAnimation;
  late Animation<double> _anglaisAnimation;
  late Animation<double> _arabeAnimation;
  double francaisScore = 0.8;
  double anglaisScore = 0.75;
  double arabeScore = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2), // Durée de l'animation en secondes
      vsync: this,
    );

    // Initialiser les animations avec les scores initiaux
    _francaisAnimation =
        Tween<double>(begin: 0, end: francaisScore).animate(_controller);
    _anglaisAnimation =
        Tween<double>(begin: 0, end: anglaisScore).animate(_controller);
    _arabeAnimation =
        Tween<double>(begin: 0, end: arabeScore).animate(_controller);

    // Ajouter un écouteur pour reconstruire le widget lorsque l'animation change
    _controller.addListener(() {
      setState(() {}); // Reconstruire le widget pour mettre à jour l'animation
    });

    // Lancer l'animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Libérer les ressources de l'animation
    super.dispose(); // Appeler la méthode dispose du parent
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Langues',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Container(
            child: buildTextSection('العربية', 'مرحبا، كيف حالك؟', _arabeAnimation,
                'images/arabic_flag.png'),
          ),

          Container(
            child: buildTextSection(
                'Français', 'Bonjour, comment ça va?', _francaisAnimation,
                'images/french_flag.png'),
          ),


          Container(
            child: buildTextSection('English', 'Hello, how are you?', _anglaisAnimation,
                'images/english_flag.png'),
          ),
        ],
      ),
    );
  }

  Widget buildTextSection(String language, String text,
      Animation<double> animation, String flagImagePath) {
    double percentage = animation.value *
        100;
    String statusText = '';

    if (percentage >= 100) {
      statusText = 'Langue maternelle';
    } else if (percentage >= 80) {
      statusText = 'Courant';
    } else if (percentage >= 75) {
      statusText = 'Courant';
    }

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    flagImagePath,
                    width: 40,
                    height: 20,
                  ),
                  SizedBox(width: 12.0),
                  Text(
                    language,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Row(
                    children: List.generate(
                      (animation.value * 5).toInt(),

                          (index) => Icon(Icons.star, color: Colors.yellow),
                    ),
                  );
                },
              ),

              IconButton(
                icon: Icon(Icons.spatial_audio_off, color: Colors.green),

                onPressed: () {

                },
              ),
            ],
          ),
          SizedBox(height: 8.0),
          LinearProgressIndicator(
            value: animation.value,
            backgroundColor: Colors.grey[300],

            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),

            minHeight: 10,
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Text(
                statusText,

                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          Divider(height: 20.0, color: Colors.grey),
        ],
      ),
    );
  }
}