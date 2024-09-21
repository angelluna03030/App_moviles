import 'dart:math';

import 'package:flutter/material.dart';
import 'package:holamundo/Edit.dart';
import 'package:holamundo/create.dart';

import "sqlhelper.dart";

void main() => runApp(MaterialApp(
      initialRoute: "/",
      
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HeaderHolas2(),
        "creata": (context) => Create(),
      },
    ));

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  List<Map<String, dynamic>> _items = [];

  bool _isLoading = true;
  Color generateRandomColor() {
    final random = Random();

    final int r = random.nextInt(256);
    final int g = random.nextInt(256);
    final int b = random.nextInt(256);
    return Color.fromRGBO(r, g, b, 1);
  }

  void _refreshItems() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _items = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshItems();
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Libros'),
      
    ),
    body: _isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: _items[index]['color'] ?? generateRandomColor(),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                
                contentPadding: EdgeInsets.all(15),
                title: Text(
                  _items[index]['title'],
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      _items[index]['fechapublicacion'],
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Descripción: ${_items[index]['description']}',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Precio: ${_items[index]['precio']}',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Edit(
                            itemId: _items[index]['id'],
                            itemTitle: _items[index]['title'],
                            itemDescription: _items[index]['description'],
                            itemprecio: _items[index]['precio'],
                            itemfechapublicacion: _items[index]['fechapublicacion'] ?? "5/3/2024",
                          ),
                        )).then((_) {
                          _refreshItems();
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.white),
                      onPressed: () async {
                        await SQLHelper.deleteItem(_items[index]['id']);
                        _refreshItems();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white),
      onPressed: () {
        Navigator.pushNamed(context, "creata").then((_) {
          _refreshItems();
        });
      },
    ),
  );
}


}

class HeaderHolas2 extends StatefulWidget {
  const HeaderHolas2({Key? key}) : super(key: key);

  @override
  _HeaderHolasState2 createState() => _HeaderHolasState2();
}

class _HeaderHolasState2 extends State<HeaderHolas2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
          seconds:
              3), // Aumentar la duración para ver el movimiento más claramente
      vsync: this,
    )..repeat(
        reverse:
            true); // Esto permitirá que la animación se repita de forma infinita

    // Animación entre 0.2 y 0.4 para un movimiento más notable
    _animation = Tween<double>(begin: 0.2, end: 0.4).animate(_controller)
      ..addListener(() {
        setState(
            () {}); // Esto es necesario para redibujar el widget con cada cambio de la animación
      });
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Liberar el controlador cuando el widget se desmonte
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 900, // Definir una altura fija para la visualización
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderHolasPainter(
              _animation.value), // Pasar el valor de la animación al pintor
        ),
      ),
    );
  }
}

class _HeaderHolasPainter extends CustomPainter {
  final double waveAnimationValue;

  _HeaderHolasPainter(this.waveAnimationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint()
      ..color = Colors.blue[300]! // Color más visible para la demostración
      ..style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height * 0.25);
    // Usar el valor animado para influir en más puntos de control y crear un efecto de ola más dinámico
    path.quadraticBezierTo(
        size.width * (0.25 + waveAnimationValue),
        size.height * (0.1 + waveAnimationValue),
        size.width * 0.5,
        size.height * 0.20);
    path.quadraticBezierTo(
        size.width * (0.75 - waveAnimationValue),
        size.height * (0.3 - waveAnimationValue),
        size.width,
        size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      true; 
}
