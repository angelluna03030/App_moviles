

import 'package:flutter/material.dart';

class  CardPage extends StatefulWidget {
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  int conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
         
        title: Text('Card'),
    
      ),
      body: ListView(
        padding: const EdgeInsets.all(2),
        children: <Widget>[
      for (int i = 0; i < conteo; i++) _cardTipo1(),
          const SizedBox(height: 30),
         _carTipo2(),
      
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child:const Icon(Icons.add),
        onPressed: () {
          setState(() {
            conteo++;
          });
        },
      ),
    );
  }

  Widget _cardTipo1() {
    
    return Card(
      elevation: 7.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        
        children: <Widget>[
         const  ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('hola '),
            subtitle: Text  ('hola como estas hace tiempo no se de ti, y se no somos nada pero me aria feliz!!!!',   maxLines: 3)
 ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  setState(() {
                    conteo--;
                  });
                },
              ),
              TextButton(
                child: const Text('ok'),
               
                onPressed: () {},
                 onLongPress: () {
                  
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  //para las imagenes
 Widget _carTipo2() {
 
    final card =   Container(
   //   clipBehavior: Clip.antiAlias,
    
      child: Column(
        children: <Widget>[
    const     FadeInImage(
            image: NetworkImage(
                'https://media.gq.com.mx/photos/60cf8f0a33c54bdef67610ee/16:9/w_2560%2Cc_limit/paisaje.jpg'),
            placeholder: AssetImage('recursos/carga.gif'),
            fadeInDuration: Duration(milliseconds: 200),
         height: 230.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            color:Colors.white,
            child: const Text('nuevo paisajes  '),
          ),
        ],
      ),
    );
    return Container(
 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
         color:Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 10.0,
            offset: Offset(1.2,19.3)
          )
        ]
      ),
      
       child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
       ),
    );
  }
}

