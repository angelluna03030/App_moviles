import 'package:flutter/material.dart';

import 'sqlhelper.dart';

class Edit extends StatefulWidget {
  final int itemId;
  final String itemTitle;
  final String itemDescription;
  final String itemfechapublicacion;
  final String itemprecio;

  const Edit(
      {super.key,
      required this.itemId,
      required this.itemTitle,
      required this.itemDescription,
      required this.itemfechapublicacion,
      required this.itemprecio});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _fechapublicacionController;
  late TextEditingController _precioController;
  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.itemTitle);
    _descriptionController =
        TextEditingController(text: widget.itemDescription);
    _fechapublicacionController =
        TextEditingController(text: widget.itemfechapublicacion);
    _precioController = TextEditingController(text: widget.itemprecio);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _updateItem(int id) async {
    if (_formKey.currentState!.validate()) {
      await SQLHelper.updateItem(
          id, _titleController.text, _descriptionController.text, _fechapublicacionController.text, _precioController.text);
      Navigator.of(context).pop(); // Regresa a la pantalla anterior
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Item'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese un título';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese una descripción';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _fechapublicacionController,
              decoration: InputDecoration(labelText: 'Fecha de Publicación'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese una fecha';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _precioController,
              decoration: InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number, // For better input experience
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese un precio';
                }
                // Optional: Validate if price is a valid number
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _updateItem(widget.itemId),
              child: Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
