



import 'package:flutte/src/pages/Inpust.dart';
import 'package:flutte/src/pages/animeted.dart';
import 'package:flutte/src/pages/lista.dart';
import 'package:flutte/src/pages/mantener.dart';

import '../pages/card.dart';
import 'package:flutter/material.dart';
import '../pages/alert.dart';
import '../pages/avatar.dart';
import '../pages/home.dart';
import 'package:flutte/src/pages/slider.dart';
//el Map al pase el arreglo lo modifica. 
Map <String , WidgetBuilder> getApplicationRoutes(){
return <String, WidgetBuilder>{

//esto codigo es para que cuando precione, me lleve o me instancie la clase que necesito
'/'      :(context) =>  Home(),
'alert'  :(context) =>  Alert(),
'avatar' :(context) =>  Avatar(),
'card'   :(context) =>  CardPage(),
'mantener'   :(context) =>  Mantener(),
'animeted'   :(context) =>  Animeted(),
'inputs'   :(context) =>  Inputs(),
'slider'   :(context) => slider(),
'lista' : (context) => listaPage()
};
}
