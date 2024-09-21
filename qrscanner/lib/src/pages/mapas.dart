import 'package:flutter/material.dart';

class Mapas extends StatelessWidget {
  final String inf;

  // Constructor que acepta el parámetro inf
  Mapas({required this.inf});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(inf), // Usar inf aquí para mostrar la información
    );
  }
}
