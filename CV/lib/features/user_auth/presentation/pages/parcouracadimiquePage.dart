import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyDrawer/mydrawer.dart';



class ParcoursAcademiquePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parcours Académique',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildParcours(
              'DIPLOME DE BACCALAURÉAT',
              'J’ai obtenu mon diplôme de baccalauréat en sciences techniques du lycée 15 novembre 1956 en 2019 avec la mention assez-bien.',
              'images/bac.png', // Chemin de l'image du diplôme de baccalauréat
            ),
            SizedBox(height: 32.0),
            _buildParcours(
              'DIPLOME DE LICENCE',
              'J\'ai obtenu ma licence en ingénierie des systèmes informatiques à la faculté des sciences de Sfax en 2022 avec la mention bien. J\'ai un diplôme national de licence spécialité systèmes embarqués et internet des objets.',
              'images/licence.png', // Chemin de l'image du diplôme de licence
            ),
            SizedBox(height: 32.0),
            _buildParcours(
              'Actuellement étudiant à l\'Institut International de Technologie (IIT)',
              '',
              'images/dip.png',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParcours(String title, String description, String imagePath) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Gris clair
        border: Border.all(
          color: Colors.teal, // Couleur de la bordure
          width: 2.0, // Épaisseur de la bordure
        ),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          SizedBox(height: 16.0),
          Text(
            description,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16.0),
          Center(
            child: Image.asset(
              imagePath,
              width: 370,
              height: 250,
            ),
          ),
        ],
      ),
    );
  }
}
