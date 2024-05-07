import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/webviewPage.dart'; // Importez la page WebView
import 'MyDrawer/mydrawer.dart';

class PositionPage extends StatelessWidget {

  void _openGoogleMapsLink() async {
    final url = 'https://www.google.com/maps/place/34.7759513,10.706104';
    if (await canLaunch(url)) {
      await launch(url);
    } else {

      print("Erreur lors de l'ouverture du lien Google Maps");
    }
  }


  void _openGoogleMapsInWebView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewScreen(
          url: 'https://www.google.com/maps/place/34.7759513,10.706104', pageTitle: 'Ma Position',

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ma Position',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/carte.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              InkWell(
                onTap: () {
                  _openGoogleMapsInWebView(
                      context);
                },
                child: Image.asset(
                  'images/position.png',

                  width: 170,
                  height: 170,
                ),
              ),

              SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Appuyez sur l'icon pour voir l'emplacement",
                      style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.w800), // Mettre le texte en rouge et en gras
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
