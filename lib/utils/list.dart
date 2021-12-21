import 'dart:convert';
import 'package:flutter/services.dart';

class ListProvider {
  List<dynamic> opciones = [];

  Future<List<dynamic>> cargarData() async {
    final respuesta = await rootBundle.loadString('assets/juegos.json');
    Map<String, dynamic> dataMap = json.decode(respuesta);
    opciones = dataMap['juegos'];
    return opciones;
  }
}

// ignore: non_constant_identifier_names
final listprovider = ListProvider();
