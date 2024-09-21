import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
final  estiloTexto = new TextStyle(fontSize: 25 );
 final  conteo = 10;


 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Titulo'),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 9, 19, 73),
      bottom: Tab(child: Text("otro boton"))
    ),
    body: Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
         children: <Widget>[
        Text('numeros de clicks', style: estiloTexto ),
         Text('$conteo', style:  estiloTexto),
      ],
      )
    ),
    floatingActionButton: FloatingActionButton(
   child:  Icon(Icons.add),
      onPressed: () {

      },
       ),
       
  );
}


}