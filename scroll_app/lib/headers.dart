import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
       _IconHeaderBackgraund(),
      Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            FontAwesomeIcons.plus,
            size: 250,
            color: Colors.white.withAlpha(30),
          )),
      Column(
        children: <Widget>[
          const SizedBox(
            height: 80,
            width: double.infinity,
          ),
          Text(
            "Haz tu salocitud",
            style:
                TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.5)),
          ),
          Text(
            "Asistencia medica",
            style: TextStyle(
                fontSize: 30,
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.bold),
          ),
          const FaIcon(
            FontAwesomeIcons.plus,
            size: 80,
            color: Colors.white,
          )
        ],
      )
    ]);
  }
}

class _IconHeaderBackgraund extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xff526BF6),
                Color(0xff67acf2),
              ])),
    );
  }
}
