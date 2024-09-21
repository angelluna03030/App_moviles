import 'package:flutter/material.dart';


class Mantener extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      
        floatingActionButton: FloatingActionButton(
  //el icono 
  child:const Icon(Icons.arrow_back_ios_outlined),
//al precionar me devulve a la pagina del principio 
onPressed: () => Navigator.pop(context),),
        appBar: AppBar(
          title: const Text('Ejemplo de LongPress en Flutter'),
        ),
        body: Center(
          child: MyButton(),
        ),
      ),
    );
  }
}
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        final snackBar = SnackBar(
          content: Text('¡Pulsación larga detectada!'),
          duration:  Duration(seconds: 5), // Duración del mensaje en pantalla
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: const EdgeInsets.all(20.0),
        color: const Color.fromARGB(255, 0, 9, 15),
        child: const Text(
          'Mantén presionado',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
