import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:proyecto_tecnologias_moviles_2/global/environment.dart';
import 'package:proyecto_tecnologias_moviles_2/models/login_response.dart';
import 'package:proyecto_tecnologias_moviles_2/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  Usuario? usuario;

  bool _autenticando = false;
  final _storage = new FlutterSecureStorage();
  bool get autenticando => this._autenticando;
  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }

  Future crearUsusrios(String nombre, String email, String password) async {
    this.autenticando = true;
    final uri = Uri.parse('${Enviroment.apiUrl}/users/log');
    //final data = {'nombre': nombre, 'email': email, 'password': password};
    final resp = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'nombre': nombre,
          'email': email,
          'password': password
        },
      ),
    );

    this.autenticando = false;
    print(resp.body);
    return true;
  }

  Future<bool> login( String email, String password) async {
    this.autenticando = true;
    final response = await http.post(
      Uri.parse("${Enviroment.apiUrl}/usuarios"),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    this.autenticando = false;
    print(response.body);
    return true;
  }

Future<bool> ingresarCompra(String nombre, String descripcion, String precio) async {
    this.autenticando = true;
    final uri = Uri.parse('${Enviroment.apiUrl}/compras/log');
    //final data = {'nombre': nombre, 'email': email, 'password': password};
    final resp = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'nombre': nombre,
          'descripción': descripcion,
          'precio': precio
        },
      ),
    );

    this.autenticando = false;
    print(resp.body);
    return true;
  }
  Future<bool> IngresarCar(String nombre,  String precio) async {
    this.autenticando = true;
    final uri = Uri.parse('${Enviroment.apiUrl}/car');
    //final data = {'nombre': nombre, 'email': email, 'password': password};
    final resp = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'nombre':nombre,
          'precio': precio
        },
      ),
    );

    this.autenticando = false;
    print(resp.body);
    return true;
  }

 Future<bool> eliminarCar( String nombre, String precio) async {
    this.autenticando = true;
    final response = await http.post(
      Uri.parse("${Enviroment.apiUrl}/eliminacar"),
      body: jsonEncode(<String, String>{
        'nombre': nombre,
        'precio': precio
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    this.autenticando = false;
    print(response.body);
    return true;
  }
  
}
