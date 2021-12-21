import 'package:flutter/material.dart';

class Juegos {
  //int id_juegos;
  String nombre;
  String descripcion;
  String precio;

  Juegos({
        //required this.id_juegos,
      required this.nombre,
      required this.descripcion,
      required this.precio});
        factory Juegos.fromJson(Map<String, dynamic> json) => Juegos(
      //id_juegos: json["id_juegos"], 
      nombre: json['nombre'], descripcion: json['descripcion'], precio: json['precio']);
}

