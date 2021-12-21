import 'package:flutter/material.dart';

class Compras {
  int id_compras;
  String nombre;
  String precio;
  String descripcion;

  Compras(
      {required this.id_compras,
      required this.nombre,
      required this.precio,
      required this.descripcion});

  factory Compras.fromJson(Map<String, dynamic> json) => Compras(
      id_compras: json['id_compras'],
      nombre: json['nombre'],
      precio: json['precio'],
      descripcion: json['descripción']);
}
