// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function(int) onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PageNavegacion extends StatelessWidget {


  final List<PinterestButton> items = [
    PinterestButton(
      onPressed: (i) {
        print("presionó el $i");
      },
      icon: Icons.pie_chart,
    ),
    PinterestButton(
      onPressed: (i) {
        print("presionó el $i");
      },
      icon: Icons.search,
    ),
    PinterestButton(
      onPressed: (i) {
        print("presionó el $i");
      },
      icon: Icons.notifications,
    ),
    PinterestButton(
      onPressed: (i) {
        print("presionó el $i");
      },
      icon: Icons.supervised_user_circle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(), // No es necesario utilizar 'new'
    
        child: Container(
          child: _MenuItem(items),
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(color: Colors.black38, spreadRadius: -5, blurRadius: 5)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(90)),
          ),
          height: 60,
          width: 250,
        ),
      
    );
  }
}

class _MenuItem extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItem(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (index) => _PinterestPainters(
          index: index,
          item: menuItems[index],
        ),
      ),
    );
  }
}

class _PinterestPainters extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestPainters({
    required this.index,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final itemSelect = Provider.of<_MenuModel>(context).itemSeleccionado;
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed(index);
      },
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 450),
        transform:
            Matrix4.translationValues(0, (itemSelect == index) ? -8 : 0, 0),
        child: Icon(
          item.icon,
          color: (itemSelect == index) ? Colors.blue : Colors.blueGrey,
          size: (itemSelect == index) ? 35 : 25,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int i) {
    this._itemSeleccionado = i;
    notifyListeners();
  }
}
