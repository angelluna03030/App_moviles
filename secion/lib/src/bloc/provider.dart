import 'package:flutter/material.dart';
import 'package:secion/src/bloc/bloc.dart';
export 'package:secion/src/bloc/bloc.dart';
// Asegúrate de que la ruta al archivo sea correcta


class AppProvider extends InheritedWidget {
  final LoginProvider loginBloc;

  // Constructor privado de AppProvider
  AppProvider._internal({Key? key, required Widget child, required this.loginBloc})
      : super(key: key, child: child);
      
  factory AppProvider({Key? key, required Widget child}) {
    var bloc = LoginProvider();
    return AppProvider._internal(key: key, child: child, loginBloc: bloc);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  // Método estático para acceder al LoginProvider desde cualquier parte de la app mediante el contexto.
  static LoginProvider of(BuildContext context) {
    final AppProvider? result = context.dependOnInheritedWidgetOfExactType<AppProvider>();
    if (result == null) {
      throw FlutterError('No se encontró el AppProvider en el contexto');
    }
    return result.loginBloc;
  }
}

