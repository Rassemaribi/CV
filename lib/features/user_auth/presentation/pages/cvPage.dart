import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:path_provider/path_provider.dart';
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

class PDFViewerPage extends StatefulWidget {
  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  final String pdfPath = 'assets/cv_racem_20244.pdf';

  Future<void> savePDFToDevice() async {
    Directory? appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir!.path;
    File file = File('$appDocPath/cv_racem_20244.pdf');
    ByteData data = await rootBundle.load(pdfPath);
    List<int> bytes = data.buffer.asUint8List();
    await file.writeAsBytes(bytes);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Le PDF a été enregistré dans le mémoire du téléphone.'),
    ));
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          savePDFToDevice();
        },
        child: Icon(Icons.save),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
