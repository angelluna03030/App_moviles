
import 'package:flutte/src/providers/menu_provider.dart';
import 'package:flutte/src/utils/icono.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text("Componentes"),
      ),
      body: FutureBuilder(
        future: MenuProvider.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: _listaItem(snapshot.data!, context),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  List<Widget> _listaItem(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing:const  Icon(Icons.keyboard_arrow_right, color: Color.fromARGB(179, 0, 0, 0)),
        onTap: () {
//esta me va a llevar a la otra pagina,este seria el link 
//el nombre de mi rutas tiene que esatr definido en el main.dart
//                     en nombre es este 
Navigator.pushNamed(context, opt['ruta']);//<-----

        }
      );
      
      //esto se va agragar en mi Arry 
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }
}





