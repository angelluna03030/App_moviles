import 'package:flutter/material.dart';

class slider extends StatefulWidget {
  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  double _valorSlider = 100.0;
  bool _bloqueo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        
        child: Column(
          children: <Widget> [
            _crearSlider(),
            _checkBox(),
             _crearswitch(),
            Expanded(child:    _crearimagen()
            )
         
          ],
        ),

      ),
    );
  }
  Widget _crearSlider(){

 
    return Slider(
      activeColor: Colors.indigo,
      label: 'tamaño de la imagen',

      value: _valorSlider,
    min: 10.0,
    max: 400.0,
    onChanged:(_bloqueo) ? null :  (valor){
      setState(() {
        
      });
      _valorSlider = valor;
    } ,);
  }


  Widget _checkBox(){
   /* return Checkbox(value: _bloqueo,
     onChanged: ( valor){
      setState(() {
           _bloqueo = valor!;
      });
   
    });*/
    return CheckboxListTile(
      title: Text('Bloquear Eslaider'),
    value: _bloqueo,
    onChanged:( valor){
      setState(() {
           _bloqueo = valor!;
      });
   
    } 
    );
  }

Widget _crearswitch(){
    return SwitchListTile(
      title: Text('Bloquear Swit'),
    value: _bloqueo,
    onChanged:( valor){
      setState(() {
           _bloqueo = valor;
      });
   
    } 
    );
}

  Widget _crearimagen(){
    return Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSLulenmpUlRp4m1ry2u169Yt-XENZzo5sIg&usqp=CAU'),
    width: _valorSlider,
    fit: BoxFit.contain);
  }
}