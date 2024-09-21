import 'dart:async';

import 'package:secion/src/bloc/validaciones.dart';
import 'package:rxdart/rxdart.dart';

class LoginProvider with Validaciones {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  Stream<String> get emailString =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordString =>
      _passwordController.stream.transform(validarPassword);
  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailString, passwordString, (a, b) => true);
  Function(String) get chatEmail => _emailController.sink.add;
  Function(String) get chatPassword => _passwordController.sink.add;
  String get email => _emailController.hasValue ? _emailController.value : 'angel luna';
  String get password => _passwordController.hasValue ? _passwordController.value : '123456789';
  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
