import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider{
  List<dynamic> opciones = [];
  _MenuProvider(){
  }
   Future<List <dynamic>> cargarData() async{
    //aqui me trae el JSOn que he creado en data/menu_opts.json
final resp = await rootBundle.loadString('data/menu_opts.json');
Map dataMap = json.decode(resp);
print(dataMap['rutas']);
opciones = dataMap['rutas'];
return opciones;
}
   }
   //como la clese en privada aqui la instancion y exporto asi otros lados. 
final MenuProvider = new _MenuProvider();

