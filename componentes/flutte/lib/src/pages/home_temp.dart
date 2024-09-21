import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['uno', "dos ", "tres", "cuatro", "cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
title:const Text('comoponentes'),
      ),
      body: ListView(
        children: _crearItemsCorta(),
      ),
    );
  }

 List<Widget> _crearItems() {

List<Widget> lista =[];
for (String opt in opciones) {
  final teemWidget = ListTile(
    title:  Text(opt),
  );
  lista..add(teemWidget)
       ..add(const Divider());
    
}
    return lista;
  }
  List<Widget> _crearItemsCorta(){
return opciones.map((item) {
return Column(
  children: [
        ListTile(

      title: Text(item + '!'),
        subtitle:const Text("cualquier cosa!!"),
        leading:  const Icon(Icons.account_balance_wallet),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () {
          
        },
    ),
   const Divider()
  ],
);
}).toList();

  }
}
