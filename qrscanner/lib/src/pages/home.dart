// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qrscanner/src/pages/dirreciones.dart';
import 'package:qrscanner/src/pages/mapas.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currenindex = 0;
  String qrVAlue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "QR Scanner",
          style: TextStyle(
            color: Colors.tealAccent,
          ),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.tealAccent,
              ))
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _cargarPagina(currenindex),
      bottomNavigationBar: _navegacion(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _scanQR,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.filter_center_focus, color: Colors.tealAccent),
      ),
    );
  }

  Widget _navegacion() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: "Mapas"),
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5), label: "Direcciones")
      ],
      currentIndex: currenindex,
      unselectedItemColor: Colors.tealAccent,
      fixedColor: Colors.tealAccent,
      onTap: (index) {
        setState(() {
          currenindex = index;
        });
      },
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Widget _cargarPagina(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return Mapas(inf: qrVAlue);
      case 1:
        return Dirreciones();
      default:
        return Mapas( inf: qrVAlue);
    }
  }

  void _scanQR() async {
    
    String? cameraScanResult = 
    await scanner.scanPhoto();
    setState(() {
      qrVAlue = cameraScanResult;
    });
  }

}
