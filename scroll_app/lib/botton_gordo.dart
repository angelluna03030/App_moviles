import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottonGordo extends StatelessWidget {
  const BottonGordo({Key? key});

  @override
  Widget build(BuildContext context) {
    return _BottonGordoBackground();
  }
}

class _BottonGordoBackground extends StatelessWidget {
  const _BottonGordoBackground({Key? key});

  @override
  Widget build(BuildContext context) {
    return  Column(
children: [
        Bottones(Color(0Xff6989f5), Color(0Xff906ef5),
              FontAwesomeIcons.carCrash, "Accidente de "),
      Bottones(Color(0Xff6989f5), Color(0Xff906ef5),
              FontAwesomeIcons.carCrash, "Accidente de "),
        
             Bottones(Color(0Xff6989f5), Color(0Xff906ef5),
              FontAwesomeIcons.carCrash, "Accidente de "),
    
            Bottones(Color(0Xff6989f5), Color(0Xff906ef5),
              FontAwesomeIcons.carCrash, "Accidente de "),
              
            Bottones(Color(0Xff6989f5), Color(0Xff906ef5),
              FontAwesomeIcons.carCrash, "Accidente de "),
      ],
      
      
    );
  }

  Container Bottones(Color color1, Color color2, IconData icons, String texto) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[color1, color2]),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(4, 6),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  icons,
                  size: 150,
                  color: Colors.white.withOpacity(0.5),
                )),
            Positioned(
              bottom: 35,
              right: 300,
              child: FaIcon(FontAwesomeIcons.carCrash,
                  size: 40, color: Colors.white),
            ),
            Positioned(
              top: 35,
              right: 20,
              child: FaIcon(FontAwesomeIcons.chevronRight,
                  size: 30, color: Colors.white),
            ),
            Positioned(
              top: 35,
              left: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    texto,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
