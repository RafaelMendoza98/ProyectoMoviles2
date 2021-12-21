import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tecnologias_moviles_2/global/environment.dart';
import 'package:proyecto_tecnologias_moviles_2/models/compras1.dart';

class ComprasPage extends StatefulWidget {
  ComprasPage({Key? key}) : super(key: key);

  @override
  _ComprasPageState createState() => _ComprasPageState();
}

class _ComprasPageState extends State<ComprasPage> {
  List<Compras> response = [];

  _ComprasPageState() {
    compras().then((value) {
      response = value;
      setState(() {});
    });
  }

  Future<List<Compras>> compras() async {
    final response = await http.get(Uri.parse('${Enviroment.apiUrl}/compras'));
    if (response.statusCode == 200) {
      final List t = json.decode(response.body);
      final List<Compras> portasAbertasList =
          t.map((item) => Compras.fromJson(item)).toList();
      return portasAbertasList;
    } else {
      throw Exception('Failed to get user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13, 20, 35, 1),
        title: Text("Compras"),
        leading: IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'carrito');
          },
        ),
      ),
      body: FutureBuilder<List<Compras>>(
          future: compras(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    var juegi = snapshot.data![index];
                    return ListTile(
                      title: Text(juegi.nombre),
                      subtitle: Text(juegi.descripcion),
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
