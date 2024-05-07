import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'MyDrawer/mydrawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Afficher un PDF',
      home: PDFViewerPage(),
    );
  }
}

class PDFViewerPage extends StatelessWidget {
  final String pdfPath = 'assets/cv_racem_20244.pdf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mon CV PDF',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      drawer: MyDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SfPdfViewer.asset(pdfPath),
      ),
    );
  }
}
