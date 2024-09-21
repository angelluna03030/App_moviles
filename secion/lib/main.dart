import 'package:flutter/material.dart';
import 'package:secion/src/bloc/provider.dart';
import 'package:secion/src/pages/home.dart';
import 'package:secion/src/pages/login.dart';
import 'package:secion/src/pages/producto_pages.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AppProvider(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inicio de secion',
      initialRoute: 'home',
      // ignore: prefer_const_constructors
      routes: {'login': (context) => Login(), 'home': (context) => Home(), 'Productos' : (context)=> ProductoPage()},
      theme: ThemeData(primaryColor: Colors.deepPurple),
    ));
  }
}
