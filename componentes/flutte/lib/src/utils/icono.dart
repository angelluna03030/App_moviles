import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  //este seria los ixonos de mi palicacion 
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'camera': Icons.camera,
  'donut_large' : Icons.donut_large,
  'input': Icons.input,
  'slider': Icons.list,
  'list' : Icons.list_outlined
};

Icon getIcon(String nombreIcon) {
  if (_icons.containsKey(nombreIcon)) {
    return Icon(_icons[nombreIcon], key: ValueKey(nombreIcon));
  } else {
    return Icon(Icons.folder_open, key: ValueKey(nombreIcon));
  }
}
