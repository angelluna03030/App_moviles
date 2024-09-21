import 'package:animaciones/pagina1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NaveacionPage extends StatelessWidget {
  const NaveacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("notificacion pages"),
      ),
      bottomNavigationBar: BottoNavegacion(),
      floatingActionButton: Botonflotante(),
    );
  }
}

class Botonflotante extends StatelessWidget {
  const Botonflotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      
      backgroundColor: Colors.pink,
      onPressed: () {
               Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => PaginaUno()));
         
      },
      child: FaIcon(FontAwesomeIcons.play,color: Colors.white, ),
    );
  }
}

class BottoNavegacion extends StatelessWidget {
  const BottoNavegacion({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items:  [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bone),
          label: "Bones",
        ),
        BottomNavigationBarItem(
            icon: Stack(
              children: [
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  right: 0.0,
                  top: 0.0,
                  child: Container(

                    height: 9,
                    width: 9,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink,
                    ),

                    )
                )
              ],
            ),
            label: "Notificaciones",
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dog), label: "Bones")
      ],
    );
  }
}
