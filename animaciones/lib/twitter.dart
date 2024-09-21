import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class TwitterPage extends StatefulWidget {
  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool animate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
animate = true;
setState(() {
  
});
        },
        backgroundColor: Colors.white,
        child: const FaIcon(
          FontAwesomeIcons.play,
          color: const Color(0xff1Da1f2),
        ),
      ),
      backgroundColor: const Color(0xff1Da1f2),
      body: Center(
        child: ZoomOut(

          animate: animate,
            duration: const Duration(seconds: 1),
            from: 30,
            child: const FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.white,
              size: 40,
            )),
      ),
    );
  }
}
