import 'package:flutter/material.dart';
import 'package:secion/src/bloc/model/model_pages.dart';
import 'package:secion/src/utils/utils.dart';

class ProductoPage extends StatefulWidget {
  const ProductoPage({super.key});
  @override
  State<ProductoPage> createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formkey = GlobalKey<FormState>();
  ModelPages producto = new ModelPages(id: "1", fotoUrl: "2");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.photo_size_select_actual)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              key: formkey,
              child: Column(
                children: <Widget>[
                  _crearNombre(),
                  _crearPrecio(),
                  const SizedBox(
                    height: 20,
                  ),
                  _crearDisponible(),
                  _crearBotton()
                ],
              )),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(labelText: 'Producto'),
      validator: (value) {
        if (value!.length < 3) {
          return 'Ingresar el nombre del producto';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        producto.titulo = newValue!;
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(labelText: 'Precio'),
      validator: (value) {
        if (isNumeric(value!)) {
          return null;
        }
        if (value.isEmpty) {
          return "esta vacio";
        } else {
          return "solo numeros";
        }
      },
      onSaved: (newValue) {
        producto.valor = double.parse(newValue!);
      },
    );
  }

  Widget _crearBotton() {
    return ElevatedButton(
        onPressed: () {
          _submit();
        },
        child: Container(
          width: 100,
          height: 65,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const Row(
            children: <Widget>[
              Icon(Icons.save),
              SizedBox(width: 10),
              Text(
                "guardar",
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
        ));
  }

  void _submit() {
    if (!formkey.currentState!.validate()) return;
    formkey.currentState?.save();
    print("todo okey");
    print(producto.titulo);
    print(producto.valor);
    print(producto.disponible);
  }

  Widget _crearDisponible() {
    return SwitchListTile(
      value: producto.disponible,
      activeColor: Colors.deepPurple,
      title: Text("Disponible"),
      onChanged: (value) => setState(() {
        producto.disponible = value;
      }),
    );
  }
}
