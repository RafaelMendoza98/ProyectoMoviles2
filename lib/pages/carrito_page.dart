import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tecnologias_moviles_2/global/environment.dart';
import 'package:proyecto_tecnologias_moviles_2/models/carrito.dart';

class CarritoPage extends StatefulWidget {
  CarritoPage({Key? key}) : super(key: key);

  @override
  _CarritoPageState createState() => _CarritoPageState();
}

Future<List<Carrito>> carrito() async {
  final response = await http.get(Uri.parse('${Enviroment.apiUrl}/carrito'));
  if (response.statusCode == 200) {
    final List t = json.decode(response.body);
    final List<Carrito> portasAbertasList =
        t.map((item) => Carrito.fromJson(item)).toList();
    return portasAbertasList;
  } else {
    throw Exception('Failed to get user');
  }
}

class _CarritoPageState extends State<CarritoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13, 20, 35, 1),
        title: Text("Carro de compras"),
        leading: IconButton(
          icon: Icon(Icons.shop),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'compras');
          },
        ),
      ),
      body: FutureBuilder<List<Carrito>>(
          future: carrito(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    var car = snapshot.data![index];
                    return ListTile(
                      title: Text(car.Nombre),
                      subtitle: Text(car.Precio),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error, ${snapshot.error}"),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'listaJuegos');
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Color.fromRGBO(13, 20, 35, 1),
      ),
    );
  }
}
