import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MyDrawer/mydrawer.dart';


class CertificatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Certificats',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCertificat(
              'MACHINE LEARNING',
              '15-September-2021',
              'site cognitive class (IBM)',
              'images/machinelerning.png',
              Colors.teal,
            ),
            SizedBox(height: 16.0),
            _buildCertificat(
              'DEEP LEARNING',
              '3-October-2021',
              'site cognitive class (IBM)',
              'images/deep.png',
              Colors.teal,
            ),
            SizedBox(height: 16.0),
            _buildCertificat(
              'MAPE REDUCE AND YARN',
              '12-September-2021',
              'site cognitive class (IBM)',
              'images/mapreduce.png',
              Colors.teal,
            ),
            SizedBox(height: 16.0),
            _buildCertificat(
              'CCNAv7: Introduction aux réseaux',
              '29-Juin-2023',
              'site Cisco',
              'images/ccna.png',
              Colors.teal, // Couleur pour le titre
            ),
            SizedBox(height: 16.0),
            _buildCertificat(
              'Scrum Fundamentals',
              '19-November-2023',
              'site Scrum Study',
              'images/scrum.png',
              Colors.teal, // Couleur pour le titre
            ),
            SizedBox(height: 16.0),
            _buildCertificat(
              'Negotiation Associate',
              '14-November-2023',
              'site NGStudy',
              'images/nego.png',
              Colors.teal, // Couleur pour le titre
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificat(String title, String date, String source, String imagePath, Color titleColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '$title',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: titleColor),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          'Date : $date',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          'Source : $source',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 8.0),
        Center(
          child: Image.asset(
            imagePath,
            width: 350,
            height: 300,
          ),
        ),
        SizedBox(height: 16.0),
        Divider(
          color: Colors.grey,
          thickness: 1.0,
          height: 40.0,
        ),
      ],
    );
  }
}
