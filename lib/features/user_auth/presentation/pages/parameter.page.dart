
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';

import '../../../../config/global.params.dart';
import 'MyDrawer/mydrawer.dart';


class ParameterPage extends StatefulWidget {
  const ParameterPage({super.key});

  @override
  State<ParameterPage> createState() => _SettingsState();
}

class _SettingsState extends State<ParameterPage> {
  String mode="Jour";
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Parameter",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.teal,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: Container(
            color: Colors.white,
            height: 3,
          ),
        ),
      ),
      backgroundColor: Colors.teal[100],
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  ListTile(
                    title: const Text('Jour' ,style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
                    leading: Radio<String>(
                      value: "Light",
                      groupValue: mode,
                      onChanged: (value){
                        setState(() {
                          mode=value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Nuit',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              )),
                    leading: Radio<String>(
                      value: "Dark",
                      groupValue: mode,
                      onChanged: (value){
                        setState(() {
                          mode=value!;
                        });
                      },
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(25),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(35)),
                  onPressed: (){
                    _onSaveMode();
                  },
                  child: Text('Enrgistrer', style: TextStyle(fontSize: 18 , color: Colors.teal),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );

  }
  void _onSaveMode() async{
    GlobalParams.themeActuel.setMode(mode);

  }

}
