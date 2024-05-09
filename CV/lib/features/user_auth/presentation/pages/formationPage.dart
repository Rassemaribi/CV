import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/MyDrawer/mydrawer.dart';

class Formation {
  final String date;
  final String title;
  final String subtitle;
  final String description;
  final String logoPath;
  final String companyLogoPath;
  final String dateLogoPath;

  Formation({
    required this.date,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.logoPath,
    required this.companyLogoPath,
    required this.dateLogoPath,
  });
}

class FormationCard extends StatelessWidget {
  final String date;
  final String title;
  final String subtitle;
  final String description;
  final String logoPath;
  final String companyLogoPath;
  final String dateLogoPath;

  FormationCard({
    required this.date,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.logoPath,
    required this.companyLogoPath,
    required this.dateLogoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.teal, // Couleur de la bordure
          width: 2.0, // Épaisseur de la bordure
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(logoPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4.0),
                  ],
                ),
              ),
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(companyLogoPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(dateLogoPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              Text(
                date,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formations',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FormationPage(),
    );
  }
}

class FormationPage extends StatelessWidget {
  final List<Formation> formations = [
    Formation(
      date: 'Juin 2021 - Juillet 2021',
      title: 'Smart Ways Innovations',
      subtitle: 'mobile',
      description:
      'J\'ai fait une formation de développement mobile avec Android Studio pour acquérir les connaissances et les compétences nécessaires pour développer des applications Android de qualité professionnelle, utilisant des outils tels que Android Studio, les bibliothèques de développement Android (Android SDK) et les dernières technologies pour créer des interfaces utilisateur.',
      logoPath: 'images/android.png',
      companyLogoPath: 'images/smartwaysinnovation.png',
      dateLogoPath: 'images/date.png',
    ),
    Formation(
      date: 'Juin 2021 - Juillet 2021',
      title: 'Smart Ways Innovations',
      subtitle: 'IA',
      description:
      'J\'ai fait une formation de IA avec Jupyter pour acquérir les connaissances et les compétences nécessaires pour utiliser les outils de programmation de Jupyter pour développer des modèles d\'IA et les utiliser pour résoudre des problèmes concrets.',
      logoPath: 'images/python.png',
      companyLogoPath: 'images/smartwaysinnovation.png',
      dateLogoPath: 'images/date.png',
    ),
    Formation(
      date: 'Juin 2021 - Juin 2021',
      title: 'Smart Ways Innovations',
      subtitle: 'Embarqué',
      description:
      'J\'ai fait une formation d\'Arduino pour acquérir les connaissances et les compétences nécessaires pour utiliser la plateforme Arduino pour développer des projets électroniques interactifs. C\'est une occasion de mettre en pratique mes compétences en utilisant des composants électroniques tels que les capteurs, les actionneurs et les afficheurs pour créer des projets tels que des robots, des systèmes d\'éclairage automatisés et des systèmes de contrôle d\'un usine.',
      logoPath: 'images/ard.png',
      companyLogoPath: 'images/smartwaysinnovation.png',
      dateLogoPath: 'images/date.png',
    ),
    Formation(
      date: 'Août 2021 - Octobre 2021',
      title: 'Smart Ways Innovations',
      subtitle: 'web',
      description:
      'J\'ai fait une formation Anguler pour acquérir les connaissances et les compétences nécessaires pour utiliser le Framework Anguler pour développer des applications web riches et dynamiques. J\'ai l\'occasion de mettre en pratique mes compétences en utilisant les composants, les directives, les services et les modules d\'Anguler pour créer des applications web modernes avec une architecture solide et des performances élevées.',
      logoPath: 'images/angular.png',
      companyLogoPath: 'images/smartwaysinnovation.png',
      dateLogoPath: 'images/date.png',
    ),
    Formation(
      date: 'Nov 2021 - Nov 2021',
      title: 'Smart Ways Innovations',
      subtitle: 'DevOps',
      description:
      'J\'ai fait une formation de DevOps pour acquérir les connaissances et les compétences nécessaires pour mettre en place des processus et des outils automatisés pour améliorer la qualité, la rapidité et la fiabilité des déploiements logiciels. J\'ai l\'occasion de mettre en pratique mes compétences en utilisant des outils tels que Git, Jenkins, Ansible et Docker pour automatiser les tâches de déploiement et de configuration, et ainsi améliorer la collaboration entre les équipes de développement et d\'exploitation.',
      logoPath: 'images/docker.png',
      companyLogoPath: 'images/smartwaysinnovation.png',
      dateLogoPath: 'images/date.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mes Formations',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      drawer: MyDrawer(),
      body: PageView.builder(
        scrollDirection: Axis.horizontal, // Scrolling horizontal
        itemCount: formations.length,
        itemBuilder: (BuildContext context, int index) {
          final formation = formations[index];
          return FormationCard(
            date: formation.date,
            title: formation.title,
            subtitle: formation.subtitle,
            description: formation.description,
            logoPath: formation.logoPath,
            companyLogoPath: formation.companyLogoPath,
            dateLogoPath: formation.dateLogoPath,
          );
        },
      ),
    );
  }
}
