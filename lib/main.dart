import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Importer Firebase Auth
import 'package:flutter_firebase/features/app/splash_screen/splash_screen.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/certificatPage.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/cvPage.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/formationPage.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/home_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/login_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/parcouracadimiquePage.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/positionPage.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/stagPage.dart';

import 'features/user_auth/presentation/pages/longuePage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDYTf9Wvz8MSqOARG3DXMxePZidf6Crie0",
        appId: "1:904294901722:android:1069e35a9046a31cbdc2e3",
        messagingSenderId: "904294901722",
        projectId: "cv-projet-flutter-3dd27",
        
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
        '/formation': (context) => FormationPage(),
        '/stage': (context) => StagePage(),
        '/certificat': (context) => CertificatsPage(),
        '/parcour': (context) => ParcoursAcademiquePage(),
        '/position': (context) => PositionPage(),
        '/cv': (context) => PDFViewerPage(),
        '/langue': (context) =>LonguePage (),
      },
    );
  }
}
