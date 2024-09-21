// ignore_for_file: sort_child_properties_last, prefer_null_aware_operators, avoid_print

import 'package:flutter/material.dart';
import 'package:secion/src/bloc/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[_cuadrodeAriba(context), _loginForm(context)],
      ),
    );
  }

  Widget _cuadrodeAriba(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Color.fromRGBO(63, 63, 156, 1.0),
          Color.fromRGBO(90, 70, 178, 1.0),
        ]),
      ),
    );
    final avatar = Container(
      padding: const EdgeInsets.only(top: 80.0),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
          SizedBox(height: 10, width: double.infinity),
          Text("Inicio de sesión",
              style: TextStyle(color: Colors.white, fontSize: 25.0)),
        ],
      ),
    );
    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(
            255, 255, 255, 0.1), // Ajustado para mayor visibilidad
      ),
    );
    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(child: circulo, bottom: 20, right: -40),
        Positioned(child: circulo, bottom: 200, right: 100),
        Positioned(child: circulo, bottom: -70, right: 200),
        Positioned(child: circulo, bottom: 290),
        Positioned(child: circulo, bottom: 50, right: 260),
        avatar,
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = AppProvider.of(context);

    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
            height: 200.0,
          )),
          Container(
            width: size.width * .85,
            height: size.height * .55,
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0, 0.5),
                      spreadRadius: 3.0)
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: Column(
              children: <Widget>[
                const Text(
                  'Ingreso',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                _crearEmail(bloc),
                const SizedBox(
                  height: 30.0,
                ),
                _crearPassword(bloc),
                const SizedBox(
                  height: 30.0,
                ),
                _crearBoton(context, bloc),
                const SizedBox(
                  height: 10.0,
                ),
                const Text("¿Olvido la contraseña?")
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _crearEmail(LoginProvider bloc) {
    return StreamBuilder(
        stream: bloc.emailString,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: const Icon(Icons.alternate_email,
                      color: Colors.deepPurple),
                  hintText: 'ejemplo@correo.com',
                  labelText: 'Correo Electrónico',
                  errorText:
                      snapshot.error != null ? snapshot.error.toString() : null,
                ),
                onChanged: bloc.chatEmail),
          );
        });
  }

  Widget _crearPassword(LoginProvider bloc) {
    return StreamBuilder(
        stream: bloc.passwordString,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: const Icon(Icons.lock, color: Colors.deepPurple),
                hintText: 'Contraseña',
                errorText:
                    snapshot.error != null ? snapshot.error.toString() : null,
              ),
              onChanged: bloc.chatPassword,
            ),
          );
        });
  }

  Widget _crearBoton(context, LoginProvider bloc) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // ignore: sized_box_for_whitespace
          return Container(
            width: size.width *
                .65, // Asegura que el botón se expanda al ancho máximo dentro de su contenedor padre
            height: 60, // Altura del botón
            // Espaciado horizontal para no pegar el botón a los bordes de la pantalla
            child: ElevatedButton(
              onPressed: snapshot.hasData
                  ? () {
                      _login(bloc, context);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Colors.deepPurple, // Color del texto/iconos del botón
                elevation: 5, // Sombra del botón
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), // Bordes redondeados del botón
                ),
                padding: const EdgeInsets.symmetric(
                    vertical:
                        15), // Espaciado vertical para darle más altura al botón
              ),
              child: const Text(
                "Ingresar",
                style: TextStyle(
                  fontSize: 20, // Tamaño del texto
                  fontWeight: FontWeight.bold, // Grosor de la fuente
                ),
              ),
            ),
          );
        });
  }

  _login(LoginProvider block, BuildContext context) {
    Navigator.pushReplacementNamed(context, 'home');
    print('email: ${block.email}');
    print('password:  ${block.password}');
  }
}
