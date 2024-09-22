import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyDrawer/mydrawer.dart';

class StagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stages',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStage(
              'images/smartwaysinnovation.png',
              'Sfax, Tunis | 06/2021 - 08/2021',
              'Projet',
              'Développement d\'un kit médical pour la télésurveillance des patients atteints de la Covid-19, avec applications web et mobiles.',
              'XML, Java, Firebase, Android Studio',
              'images/atestations1.png',
              width: 350,
              height: 300,
            ),
            SizedBox(height: 20.0),
            _buildStage(
              'images/smartwaysinnovation.png',
              'Sfax, Tunis | 02/2022 - 05/2022',
              'Projet',
              'Création d\'un système industriel 4.0 pour la gestion de qualité des produits, avec applications mobiles et web.',
              'XML, Java, Firebase, Angular, Python, C',
              'images/attestation2.png',
              width: 350,
              height: 300,
            ),
            SizedBox(height: 20.0),
            _buildStage(
              'images/eds.png',
              'Sfax, Tunis | 06/2023 - 07/2023',
              'Projet',
              'Développement d\'un site web pour la gestion efficace des clients, abonnements, factures, et amélioration de la communication.',
              'Laravel, Visual Studio Code',
              'images/attestationEDS3.jpg',
              width: 400,
              height: 500,
            ),
            SizedBox(height: 20.0),
            _buildStage(
              'images/logofod.png',
              'Sfax, Tunis | 07/2024 - 08/2024',
              'Projet',
              'Mise en place d\'une application web pour le suivi et la gestion des équipements informatiques, avec une fonctionnalité de recommandation intelligente pour optimiser le parc matériel. Intitulé < Parc Informatique >, le projet vise à garantir une utilisation optimale des ressources tout en assurant un suivi précis et efficace des équipements.',
              'Docker, Kubernetes, Microsoft Azure, FastAPI, IA, Spring Boot, Angular',
              'images/fod.jpeg', // Image correcte pour l'attestation
              width: 400,
              height: 500,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStage(String title, String location, String type, String description, String skills, String imagePath,
      {required double width, required double height}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white, // Nouvelle couleur de fond
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.teal, // Couleur de la bordure
          width: 2.0, // Épaisseur de la bordure
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title.endsWith('.png')
              ? Image.asset(title, height: 150)
              : Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 8.0),
          Text(
            location,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          SizedBox(height: 8.0),
          Text(
            type,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          SizedBox(height: 12.0),
          Text(
            description,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(height: 8.0),
          Text(
            'Compétences utilisées :',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          Text(
            skills,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.blueGrey, fontSize: 16),
          ),
          SizedBox(height: 16.0),
          Center(
            child: Image.asset(
              imagePath,
              width: width,
              height: height,
            ),
          ),
        ],
      ),
    );
  }
}
