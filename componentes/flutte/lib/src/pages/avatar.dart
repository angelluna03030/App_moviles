import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class Avatar extends StatelessWidget{

@override
Widget build(BuildContext context){
  return Scaffold(
appBar: AppBar(
  title: Text('avatar'),
  
  actions: <Widget>[
    
    Container(margin: EdgeInsets.only(right: 10.0),
      child: CircleAvatar(backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Stan_Lee_by_Gage_Skidmore_3.jpg/640px-Stan_Lee_by_Gage_Skidmore_3.jpg')))
  ],
  
),
body: const Center(
    child:  const  FadeInImage(
            image:  NetworkImage(
                'https://cnnespanol.cnn.com/wp-content/uploads/2018/11/gettyimages-615970090.jpg?quality=100&strip=info'),
            placeholder: AssetImage('recursos/carga.gif'),
            fadeInDuration: Duration(milliseconds: 200),
         height: 230.0,
            fit: BoxFit.cover,
          ),
),
floatingActionButton: FloatingActionButton(
  //el icono 
  child: const Icon(Icons.arrow_back_ios_outlined),
//al precionar me devulve a la pagina del principio 
onPressed: () => Navigator.pop(context),),
  );
}
}