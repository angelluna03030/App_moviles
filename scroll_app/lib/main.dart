import 'package:flutter/material.dart';
import 'package:scroll_app/emergency.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        
        body:   EmergencyPage(),
        
      ),
    );
  }
}

