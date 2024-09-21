//de terceros 
import 'package:flutter/material.dart';



//mis archivos 

import 'pages/contador_page.dart';
class MyApp extends StatelessWidget {

@override
Widget build( context) {

  return MaterialApp(
    //esto ya a eliminar el baner que aperece en la parte de ariba a la derecha 
    debugShowCheckedModeBanner: false,
    home: Center(
      //child: HomePage() ,
      //est es la clase que la hemos crado con anterioridad 
      child:  ContadorPage(),
    )
    ,
  );
}
}