import 'package:flutter/material.dart';
import "sqlhelper.dart";

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  DateTime? selectDate; // Declare as DateTime? to allow null

void callDate() async {
  DateTime? selectedDate = await _crearDate();
  setState(() {
    selectDate = selectedDate; // Assign directly as DateTime
  });
}

  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
String _fechapublicacion ='';
void initState() {
  super.initState();
  updateFechaPublicacion();
}

void updateFechaPublicacion() {
  _fechapublicacion = selectDate?.toString().substring(0, 10) ?? "5/3/2024";

}
  String _precio = '';
  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await SQLHelper.createItem(
        _title,
        _description,
        _fechapublicacion,
        _precio
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Nuevo Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Título'),
                onSaved: (value) {
                  _title = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa un título';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descripción'),
                onSaved: (value) {
                  _description = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingresa una descripción';
                  }
                  return null;
                },
              ),
               _bottonDate(),
                TextFormField(
  decoration: InputDecoration(labelText: 'Precio'),
  keyboardType: TextInputType.number, // Ensures numerical input
  onSaved: (value) {
   
    final double precio = double.tryParse(value!) ?? 0.0;
    _precio = precio.toString();
  },
  validator: (value) {
    if (value!.isEmpty) {
      return 'Por favor ingresa un precio';
    }

    return null;
  },
),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: _submit,
                  child: Text('Libro'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


   Widget _bottonDate() {
    return TextButton(
      onPressed: () {
        callDate();
      },
      child: Text(
          // ignore: unnecessary_null_comparison
          selectDate != null ? selectDate.toString() : "Seleccionar Fecha"),
    );
  }
    Future<DateTime?> _crearDate() {
    return showDatePicker(
      context: context,
      firstDate: DateTime(2014),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(data: ThemeData.dark(), child: child!);
      },
    );
  }

}
