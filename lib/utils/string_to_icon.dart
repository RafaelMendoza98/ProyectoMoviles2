import 'package:flutter/material.dart';

final icons = <String, IconData>{
  'gtav_icon': Icons.add_circle,
  'gtaiv_icon': Icons.add_circle_outline,
  'fifa22_icon': Icons.add_circle,
  'wwe_icon': Icons.add_circle_outline,
  'dbx2_icon': Icons.add_circle
};

Icon getIcon(String nombre) {
  return Icon(icons[nombre]);
}
