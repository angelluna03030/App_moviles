import 'package:flutter/material.dart';
class Alert extends StatelessWidget{
@override
Widget build(BuildContext context){
  return Scaffold(
appBar: AppBar(
  title: Text('alert'),
),
body: Center(
  child: ElevatedButton(
  child: Text("mostar alerta"),
  clipBehavior: Clip.antiAliasWithSaveLayer,
  //onPressed: es un funciones que cuando precione mi me haga la funcion que he creado cona anterioridad 
  onPressed: () => _mostrarAlert(context),

),
),
floatingActionButton: FloatingActionButton(
  //el icono 
  child: const Icon(Icons.arrow_back_ios_outlined),
//al precionar me devulve a la pagina del principio 
onPressed: () => Navigator.pop(context),),
  );

}
//esto va a mostrar cualdo precionesmos una un menseja como un modal de html. 
void _mostrarAlert(context){
  showDialog(
    context: context,
     barrierDismissible: false,
     builder: (context){



    return AlertDialog(
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: Text('Titulo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget> [ 
        Text('hola como estas vas hace tiempo'),
        FlutterLogo( size: 100.0)
      ],
    ),
    actions: <Widget>[
      TextButton(
        child: Text('cancelar'),
        onPressed: ()=> Navigator.of(context).pop()),
         TextButton(
        child: Text('ok'),
        onPressed: ()=>{})
    ],
  );
     }
     );
}


}