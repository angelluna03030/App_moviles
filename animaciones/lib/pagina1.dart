import 'package:animaciones/navegacion.dart';
import 'package:animaciones/twitter.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaginaUno extends StatelessWidget {
  const PaginaUno({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Animaten do"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => TwitterPage()));
           
              },
              icon: const FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {

                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => PaginaUno()));
              },
              icon: const FaIcon(
                Icons.navigate_next,
                color: Colors.white,
              ))
        ],
      ),
      floatingActionButton:ElasticInRight(
          child: FloatingActionButton(
        onPressed: () {

                 Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => NaveacionPage()));
              
        },
        child:   FaIcon(
            FontAwesomeIcons.play,
            color: Colors.white,
          ),
                backgroundColor: Colors.blue,
        focusColor: Colors.blue
        ),
  
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElasticIn(
                delay: Duration(milliseconds: 1100),
                child: Icon(
                  Icons.new_releases,
                  color: Colors.blue,
                  size: 40,
                )),
            FadeInRight(
                child: Text(
              "titulo",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
            )),
            FadeInLeft(
              from: 100,
                delay: Duration(milliseconds: 1100),
                child: Text(
                  "Soy un texto pequeño",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                )),
            FadeInLeft(
              child: Container(
                width: 220,
                height: 2,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
