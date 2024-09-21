import 'package:flutter/material.dart';
import 'package:sexto/pages/otra_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text("Mapterial App Bar"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(

                child: Scrollbar(
                  child: ListView.builder(
                    itemBuilder: (context, index) => Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8GAcNf2A8wsr7rHBPhxfvi36V6Aq2kswNUg&usqp=CAU"),
            
                  ),
                ),
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
            
              Container(
                  child: Image.network(
                      "https://previews.123rf.com/images/aprillrain/aprillrain2212/aprillrain221200638/196354278-imagen-de-caricatura-de-un-astronauta-sentado-en-una-luna-ilustraci%C3%B3n-de-alta-calidad.jpg")),
              TextButton(
                onPressed: () {
                            MaterialPageRoute route = MaterialPageRoute(
                    builder: (context) =>  HomePage(),
                  );
                  Navigator.push(context, route);
                },
                child: Container(
                  child: const Text("hola mundo"),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color.fromARGB(255, 109, 121, 187),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (context) => const OtraPagina(),
                  );
                  Navigator.push(context, route);
                },
                child: Container(
                  // ignore: sort_child_properties_last
                  child: const Text(
                    "hola mundo33w",
                    style: TextStyle(color: Colors.white),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color.fromARGB(255, 109, 121, 187),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
