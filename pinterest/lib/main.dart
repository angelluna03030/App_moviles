// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:pinterest/widget/navegacion.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: ChangeNotifierProvider(
        create: (_) => MenuModel(),
        child: Scaffold(
            body: Stack(
          children: <Widget>[PinterestPage(), _MenuPinterestLocation()],
        )),
      ),
    );
  }
}

class _MenuPinterestLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<MenuModel>(context).mostar;

    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      bottom: mostrar
          ? 30
          : -60, // Mueve el widget fuera de la pantalla si no se debe mostrar
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        opacity: (mostrar) ? 1 : 0,
        duration: Duration(milliseconds: 300),
        child: Container(
          width: width,
          child: Align(
            child: PageNavegacion(
              
            ),
          ),
        ),
      ),
    );
  }
}

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PinterestGrid());
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (i) => i);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
     
      if (controller.offset > scrollAnterior  && controller.offset > 150) {
        Provider.of<MenuModel>(context, listen: false).mostrarCambio = false;
      } else {
        Provider.of<MenuModel>(context, listen: false).mostrarCambio = true;
      }
      scrollAnterior = controller.offset;
      // Notificar a los widgets que dependen de MenuModel
      Provider.of<MenuModel>(context, listen: false).notifyListeners();
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class MenuModel with ChangeNotifier {
  bool _mostrar = true;
  bool get mostar => this._mostrar;
  set mostrarCambio(bool value) {
    this._mostrar = value;
  }
}
