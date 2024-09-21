import 'dart:async';

import 'package:flutter/material.dart';
class listaPage extends StatefulWidget {


  @override
  State<listaPage> createState() => _listaPageState();
}

class _listaPageState extends State<listaPage> {
ScrollController _scrollController = new ScrollController();
  List<int> _listanumeros = [];
  int _numero = 0;
bool _isLoading = false;
  @override
  void initState() {
   
    super.initState();
    _agregar10();




    _scrollController.addListener(() { 
      var mas = _scrollController.position.maxScrollExtent;
if (
  _scrollController.position.pixels == mas
) {
fecthData();
}
    });
  }
//esto es para que no ocupo mucho espacion de memoria, pues l o que sude con el 
//ScrollController es que no elimana los que ya creado
@override
  void dispose() {

    super.dispose();
    _scrollController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('lista de imagenes'),
      ),
      body: Stack(
        children: <Widget>[
       _crearLista(),
       _clearLoading()
        ],
      )
      

    );
  }

Widget _crearLista(){ 
  return RefreshIndicator(
    onRefresh: obtenerPagina1,
    child: ListView.builder(
      controller: _scrollController,
      itemCount: _listanumeros.length,
      
  itemBuilder: (BuildContext context, int index){
    final image = _listanumeros[index];
  return FadeInImage(
     placeholder: const AssetImage('recursos/carga.gif'),
     
     image: NetworkImage('https://picsum.photos/500/300/?image=$image'));
  },
      ),
  );}
//esto es para cuando el ariba reinicie o carga toda la pagina con nueva imagenes, 
Future<Null> obtenerPagina1 () async{
  final duration = new Duration(seconds: 2);
  await new Timer(duration, () { 
_listanumeros.clear();
_numero++;
_agregar10();


  });
  return Future.delayed(duration);
}










   void _agregar10(){
     for (var i = 0; i < 10; i++) {
       _numero++;
       _listanumeros.add(_numero);
     }
     setState(() {
       
     });
    }
   Future<Null> fecthData() async{
  _isLoading = true;
  setState(() {
    final duration = new Duration(seconds: 2);
    new Timer(duration,requestHTTp);
  });
   }
   void requestHTTp(){




    _isLoading = false;

//esto es para que cuando llege al final y haya cargado baje un poquito mas y muestre las imagenes. 
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: const Duration( milliseconds: 250)
    );
   _agregar10();
   }
   Widget _clearLoading(){
    if (_isLoading) {
      return const Column(
        mainAxisSize : MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: <Widget>[  
                  CircularProgressIndicator()],
          ),
          SizedBox( height: 15.0)
        ],
      );
      

    } else {
      return Container();
    }
   }
}