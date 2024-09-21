

import 'dart:math';

import 'package:flutter/material.dart';

class Animeted extends StatefulWidget {

  @override
  _Animeted createState() => _Animeted();
}

class _Animeted extends State<Animeted> {
  double _width = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.pink;
  BorderRadius _bordeRadius = BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animacion contenedor'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.bounceOut,
          width: _width,
          height: _heigth,
          decoration: BoxDecoration(
            borderRadius: _bordeRadius,
            color: _color,

          ),
        ),
        
      ),
     floatingActionButton: FloatingActionButton(
  child:const Icon(Icons.add),
onPressed: _cambiarforma,
 )
    );
  }
  void _cambiarforma (){
   final random = Random();
//setState: es una funcione muy importa ya que esta hace que las modificaciones se hagan en tiempo real, que al precionar un circulo cambie de estado yy  no tenga que hacer holdreoud. 
    setState(() {
      _width= random.nextInt(300).toDouble() ;
    _heigth =random.nextInt(300).toDouble();
    _color = Color.fromRGBO(random.nextInt(255),random.nextInt(255) ,random.nextInt(255), 1);
    _bordeRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}