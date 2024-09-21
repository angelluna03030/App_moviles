import 'package:flutter/material.dart';

class Inputs extends StatefulWidget {
  @override
  _InputsState createState() => _InputsState();
}

class _InputsState extends State<Inputs> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInputs(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPersona(),
          Divider(),
          _crearContrasena(),
          Divider(),
          _crearFecha(),
          Divider(),
          _crearDrop(),
          Divider(),
          Text('Opción seleccionada: ${opcionSeleccionada ?? ""}'), // Muestra la opción seleccionada
        ],
      ),
    );
  }




  String _nombre = '';

  Widget _crearInputs() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }







  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento'];
  String? opcionSeleccionada = 'Volar';
  List<DropdownMenuItem<String>> getOpciones() {
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDrop() {
    return  Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0) ,
           DropdownButton<String>(
      value: opcionSeleccionada,
      items: getOpciones(),
      onChanged: (opt) {
        setState(() {
          opcionSeleccionada = opt;
        });
      },
    )],
    );
    

  }








  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Email: $_email'),
    );
  }








  String _email = '';
  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      
      },
    );
  }










  String contrasena = '';
  Widget _crearContrasena() {
    return TextField(
      obscureText: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor) {
        setState(() {
          contrasena = valor;
        });
      },
    );
  }












  String fecha = ''; // Variable para almacenar la fecha seleccionada
  Widget _crearFecha() {
    return TextField(
      enableInteractiveSelection: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.calendar_today),
      ),
      controller: TextEditingController(text: fecha), // Mostrar la fecha seleccionada
      onTap: () {
        _seleccionarFecha(context);
      },
    );
  }

  _seleccionarFecha(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
      locale: Locale('es', 'ES'),
    );

    if (pickedDate != null) {
      setState(() {
        fecha = pickedDate.toString();
      });
    }
  }
}
