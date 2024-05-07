import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({Key? key, this.child}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    const totalDuration = Duration(seconds: 4);
    const updateInterval = Duration(milliseconds: 100);
    int elapsedTime = 0;

    Timer.periodic(updateInterval, (timer) {
      elapsedTime += updateInterval.inMilliseconds;
      setState(() {
        progressValue = (elapsedTime / totalDuration.inMilliseconds).clamp(0.0, 1.0);
      });

      if (elapsedTime >= totalDuration.inMilliseconds) {
        timer.cancel();
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logocv.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: LinearProgressIndicator(
                value: progressValue,
                minHeight: 20.0,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Chargement en cours... ${(progressValue * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
