import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Home screen",style: TextStyle(
                fontSize: 40,fontWeight: FontWeight.bold,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}