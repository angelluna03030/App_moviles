
import 'package:animaciones/pagina1.dart';
import 'package:flutter/material.dart';
void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animate_do',
      debugShowCheckedModeBanner: false,
      home: PaginaUno()
    );
  }
}
