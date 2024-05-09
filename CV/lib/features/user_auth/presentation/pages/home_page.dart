import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/webviewPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'MyDrawer/mydrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon CV',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _openWebView(String url, String pageTitle) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewScreen(url: url, pageTitle: pageTitle),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Mon CV', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal.withOpacity(0.4),
      ),
      drawer: MyDrawer(),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.4),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 160,
                backgroundImage: AssetImage('images/moi.jpg'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Racem Aribi',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Étudiant Ingénieur',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Text(
                '24 ans',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {

                  launch('mailto:racem.aribi.123@gmail.com');
                },
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.teal),
                  title: Text(
                    'racem.aribi.123@gmail.com',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {

                  launch('tel:+21623986441');
                },
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.teal),
                  title: Text(
                    '+216 23 986 441',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              ListTile(
                leading: Icon(Icons.location_on, color: Colors.teal),
                title: Text(
                  'Sfax, Tunis',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'À propos de moi',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Je viens de terminer ma Licence en Ingénierie des Systèmes Informatiques à la Faculté des Sciences de Sfax (FSS) en 2022. À présent, je poursuis mes études en 2ème année du cycle d\'ingénieur en Génie Informatique à l\'Institut International de Technologie (IIT).',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 45.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('images/lindin.png'),
                    onPressed: () {
                      _openWebView(
                        'https://www.linkedin.com/in/racem-aribi-ab4775222/',
                        'LinkedIn',
                      );
                    },
                    tooltip: 'Ouvrir LinkedIn',
                  ),
                  IconButton(
                    icon: Image.asset('images/git.png'),
                    onPressed: () {
                      _openWebView(
                        'https://github.com/Rassemaribi?tab=repositories',
                        'GitHub',
                      );
                    },
                    tooltip: 'Ouvrir GitHub',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
