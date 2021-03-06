import 'dart:convert';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:proyecto_tecnologias_moviles_2/global/environment.dart';
import 'package:proyecto_tecnologias_moviles_2/models/juegos.dart';
import 'package:proyecto_tecnologias_moviles_2/pages/lista_Juegos.dart';
import 'package:proyecto_tecnologias_moviles_2/services/authenticator.dart';
import 'package:proyecto_tecnologias_moviles_2/widgets/wid_button.dart';
import 'package:proyecto_tecnologias_moviles_2/widgets/wid_label.dart';
import 'package:proyecto_tecnologias_moviles_2/widgets/wid_logo.dart';

import 'package:http/http.dart' as http;

//import 'package:proyecto_tecnologias_moviles_ll-main/pages/carito_page.dart';
import 'package:flutter/material.dart';

class GtavPage extends StatelessWidget {
  const GtavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13, 20, 35, 1),
        title: Text('PRODUCTO'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'listaJuegos');
          },
        ),
      ),

      /* FutureBuilder<List<Juegos>>(
          future: juegos(),
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
          }),*/

      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Container(
            //Toda la pantalla
            height: MediaQuery.of(context).size.height * .9,
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/gtav.png'),
                  width: 200,
                ),
                _Form(),
              ],
            ),
          ),
        ),
      ),
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

class _Form extends StatefulWidget {
  _Form({Key? key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  List<Juegos> response = [];
  final nombrel = "Gta V";
  final descripcionl = "Grand Theft Auto V es un videojuego" +
      "de acci??n-aventura de mundo abierto desarrollado por el estudio Rockstar" +
      "North y distribuido por Rockstar Games";
  final preciossl = "290";

  __FormState() {
    juegos().then((value) {
      response = value;
      setState(() {});
    });
  }
  Future<List<Juegos>> juegos() async {
    final response = await http.get(Uri.parse('${Enviroment.apiUrl}/juegos'));
    if (response.statusCode == 200) {
      final List t = json.decode(response.body);
      final List<Juegos> portasAbertasList =
          t.map((item) => Juegos.fromJson(item)).toList();
      return portasAbertasList;
    } else {
      throw Exception('Failed to get user');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        /* mainAxisAlignment: MainAxisAlignment.center,
            children: response
                .map((e) => Text(
                  
                      ' ${e.nombre}  ${e.descripcion}  ${e.precio}',
                      style: TextStyle(fontSize: 20),
                    ))
                .toList(),
      ),*/

        children: [
          WidLabel(
            //response.map((e) => Text('${e.nombre}')).toString(),
            Texto: "Gta V",
            color: Colors.white,
          ),
          WidLabel(
            //response.map((e) => Text('${e.nombre}')).toString(),
            Texto: "Grand Theft Auto V es un videojuego" +
                "de acci??n-aventura de mundo abierto desarrollado por el estudio Rockstar" +
                "North y distribuido por Rockstar Games",
            color: Colors.white,
          ),
          WidLabel(Texto: "298", color: Colors.white),
          WidButton(
              texto: 'Agregar al Carrito',
              onPressed: authService.autenticando
                  ? () => {}
                  : () async {
                      final registro =
                          await authService.IngresarCar(nombrel, preciossl);
                      if (registro == true) {
                        Navigator.pushReplacementNamed(context, 'carrito');
                      } else {
                        // mostrarAlerta(context, 'Registro Incorrecto', registro);
                      }
                    }),
          WidButton(
              texto: 'Comprar',
              onPressed: authService.autenticando
                  ? () => {}
                  : () async {
                      final registro = await authService.ingresarCompra(
                          nombrel, descripcionl, preciossl);

                      if (registro == true) {
                        Navigator.pushReplacementNamed(context, 'compras');
                      } else {
                        // mostrarAlerta(context, '', registro);
                      }
                    }),
        ],
      ),
    );
  }
}
