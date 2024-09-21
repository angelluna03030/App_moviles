import 'package:flutter/material.dart';
import 'package:secion/src/bloc/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final bloc = AppProvider.of(context);
  
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Color.fromARGB(255, 0, 102, 255),
      ),
      body: Container(),
      floatingActionButton: _crearBotton(context),
    );
  }

  Widget _crearBotton(BuildContext context) {
    return FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'Productos'),
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add));
  }
}
