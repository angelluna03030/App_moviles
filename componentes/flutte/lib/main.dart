
import 'src/pages/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../src/routes/routes.dart';
import 'package:flutter/material.dart';





void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//el tittlo de mi app 
      title: 'Componentes',
      debugShowCheckedModeBanner:  false,

// este es para el tipo de letra 
    localizationsDelegates: [
        // ...
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("es", "ES"), // español de España
        Locale("es", "MX"), // español de México
      ],
      initialRoute: '/',
      //home:  Home()

      //esto me va a llevar a las pagina que solicite 
routes: getApplicationRoutes(),
//cuunado la ruta no esta definida en ninguna de las rutas de ariba se genera esta.
onGenerateRoute: (settings) {
return MaterialPageRoute(
  builder: (context ) => Home()
);
},
);
  }
}
