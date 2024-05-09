import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.teal[300],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal[600],
              ),
              child: Center(
                child: Text(
                  'MENU',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Accueil', style: TextStyle(fontSize: 20, color: Colors.white)),
              leading: Icon(Icons.home, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: Text('Formation', style: TextStyle(fontSize: 20, color: Colors.white)),
              leading: Icon(Icons.school, color: Colors.white),
              onTap: () {
                Navigator.pop(context); // Ferme le tiroir
                Navigator.pushNamed(context, '/formation');
              },
            ),
            ListTile(
              title: Text('Stages', style: TextStyle(fontSize: 20, color: Colors.white)),
              leading: Icon(Icons.work, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/stage');
              },
            ),
            ListTile(
              title: Text('Certificats', style: TextStyle(fontSize: 20, color: Colors.white)),
              leading: Icon(Icons.file_copy, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/certificat');
              },
            ),
            ListTile(
              title: Text('Diplôme', style: TextStyle(fontSize: 20, color: Colors.white)),
              leading: Icon(Icons.school_outlined, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/parcour');
              },
            ),  ListTile(
              title: Text('Position', style: TextStyle(fontSize: 20, color: Colors.white)),
              leading: Icon(Icons.map_outlined, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/position');
              },
            ),
            ListTile(
              title: Text('langues', style: TextStyle(fontSize: 20, color: Colors.white)),
              leading: Icon(Icons.sort_by_alpha, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/langue');
              },
            ),
            ListTile(
              title: Text('Cv PDF', style: TextStyle(fontSize: 20, color: Colors.white)),
              leading: Icon(Icons.dashboard, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cv');
              },
            ),
            ListTile(
              title: Text('parameter', style: TextStyle(fontSize: 20, color: Colors.white)),
              leading: Icon(Icons.settings, color: Colors.white),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/para');
              },
            ),

            Divider(color: Colors.white),
            ListTile(
              title: Text('Déconnexion', style: TextStyle(fontSize: 20, color: Colors.white)),
              leading: Icon(Icons.logout, color: Colors.white),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('isLoggedIn');
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false); // Navigue vers la page de connexion et supprime toutes les autres pages
              },
            ),
          ],
        ),
      ),
    );
  }
}
