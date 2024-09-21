import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scroll_app/botton_gordo.dart';
import 'package:scroll_app/headers.dart';
class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Header(),
        Expanded(

          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(height: 20,),
              BottonGordo(key: UniqueKey()),
              // Agrega más elementos a la lista según sea necesario
            ],
          ),
        )
      ],
    );
  }
}
