import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/app/splash_screen/splash_screen.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/certificatPage.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/cvPage.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/formationPage.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/home_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/login_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/parameter.page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/parcouracadimiquePage.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/positionPage.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/stagPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importez SharedPreferences

import 'config/global.params.dart';
import 'features/user_auth/presentation/pages/longuePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDYTf9Wvz8MSqOARG3DXMxePZidf6Crie0",
      appId: "1:904294901722:android:1069e35a9046a31cbdc2e3",
      messagingSenderId: "904294901722",
      projectId: "cv-projet-flutter-3dd27",
    ),
  );

  String mode = await _onGetMode();
  GlobalParams.themeActuel.setMode(mode);

  runApp(MyApp());
}

Future<String> _onGetMode() async {
  String mode = "Light"; // Mode initial par défaut

  // Récupérer le mode localement à partir des SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('mode')) {
    mode = prefs.getString('mode')!;
  }

  return mode;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routes = {
    '/login': (context) => LoginPage(),
    '/signUp': (context) => SignUpPage(),
    '/home': (context) => HomePage(),
    '/formation': (context) => FormationPage(),
    '/stage': (context) => StagePage(),
    '/certificat': (context) => CertificatsPage(),
    '/parcour': (context) => ParcoursAcademiquePage(),
    '/position': (context) => PositionPage(),
    '/cv': (context) => PDFViewerPage(),
    '/langue': (context) => LonguePage(),
    '/para': (context) => ParameterPage(),
  };

  bool isLoading = true;



  void loadData() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      theme: GlobalParams.themeActuel.getTheme(),
      routes: routes,
      home:isLoading ? SplashScreen() : StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
    GlobalParams.themeActuel.addListener(() {
      setState(() {});
    });
  }
}
