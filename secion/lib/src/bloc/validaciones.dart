import 'dart:async';

mixin Validaciones {
  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 6 || password.isEmpty) {
        sink.add(password);
      } else {
        sink.addError('Más de 6 caracteres por favor');
      }
    },
  );

 final validarEmail = StreamTransformer<String, String>.fromHandlers(
  handleData: (email, sink) {
    // Definir el patrón de la expresión regular como una cadena
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError("Email no es correcto");
    }
  },
);

}
