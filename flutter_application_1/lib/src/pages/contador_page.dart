import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
@override
 createState() =>  _ContadorPageState();
  
}

class _ContadorPageState extends State<ContadorPage>{
  //esta es para el estilo de y el tamaño del texto
  final  _estiloTexto = new TextStyle(fontSize: 25 );

int _conteo = 0;
@override
Widget build(BuildContext context) {
  return Scaffold(
    //appBar para hacer con una pequeño titulo en en la parte de ariiba 
    appBar: AppBar(
      title: Text('funciones'),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 31, 31, 41),

    ),
    body: Center(
      
      //child : es para para colocar una columna en la app, pero es como una instancia a la clase padre, es es como el hijo de la clase 
      child: Column(
        //esto va a centra la columna 
        mainAxisAlignment:MainAxisAlignment.center,
//sirve para colocar mas texto 
         children: <Widget>[

          //solo aceptaria una texto, pero con children aceptas mas campos y los guarda en un arry 
        Text('numerós de clicks:', style: _estiloTexto ),
        //$_conteo es la variable que hemos crado con anterioridad 
         Text('$_conteo', style:  _estiloTexto),
          
      ],
      )
    ),
    //esta me colocara una boton en la parte de abajo a la derecha 
    floatingActionButton: _crearBotones()
  );

}
//esta son funciones pra que el codigo se mas lejible, y que no sea tan complicado de entender.
Widget _crearBotones(){
  return Row(
    //es para cambiar de pocion y acomodarlo mejor los iconos de abajo 
    mainAxisAlignment:  MainAxisAlignment.end,
    children: <Widget>[
    SizedBox(width: 30),
    FloatingActionButton(child:  Icon(Icons.exposure_zero),    backgroundColor: Color.fromARGB(255, 240, 80, 80),onPressed: _zero),
    //los utlizar para hcer una separacion para los lados de mis iconos 
    Expanded(child: SizedBox()),
    FloatingActionButton(child:  Icon(Icons.remove),   backgroundColor: Color.fromARGB(255, 240, 80, 80),onPressed:_decrmantar ),
    SizedBox(width: 9.0),
    FloatingActionButton(child:  Icon(Icons.add),    backgroundColor: Color.fromARGB(255, 240, 80, 80), onPressed: _agregar,),
        ],
      );
    }

void _agregar ()=>  setState(() {_conteo ++;});
void _decrmantar ()=>  setState(() {_conteo --;});
void _zero ()=>  setState(() {_conteo =0 ;});
}

