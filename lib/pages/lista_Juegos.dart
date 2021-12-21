import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_tecnologias_moviles_2/global/environment.dart';
import 'package:proyecto_tecnologias_moviles_2/models/juegos.dart';
import 'package:proyecto_tecnologias_moviles_2/Page_juegos/gtaV.dart';
import 'package:proyecto_tecnologias_moviles_2/pages/compras.dart';
import 'package:proyecto_tecnologias_moviles_2/pages/login_page.dart';

class ListaJuegos extends StatefulWidget {
  ListaJuegos({Key? key}) : super(key: key);
  final opciones = ['GTA V', 'World of Tanks', 'Apex Legends'];
  @override
  _ListaJuegosState createState() => _ListaJuegosState();
}

class _ListaJuegosState extends State<ListaJuegos> {
  List<Juegos> response = [];

  _ListaJuegosState() {
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
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13, 20, 35, 1),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shop),
            onPressed: () {
              Navigator.popAndPushNamed(context, 'compras');
            },
          ),
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search(widget.opciones));
            },
            icon: Icon(Icons.search),
          )
        ],
        centerTitle: true,
        title: Text('Juegos Disponibles'),
      ),
      body: FutureBuilder<List<Juegos>>(
          future: juegos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    var juegi = snapshot.data![index];
                    return ListTile(
                      title: Text(juegi.nombre),
                      onTap: () {
                        if (juegi.nombre == 'Gta V') {
                          Navigator.popAndPushNamed(context, 'mostrarjuegos');
                        } else if (juegi.nombre == 'World of Tanks') {
                          Navigator.popAndPushNamed(context, 'wof');
                        } else if (juegi.nombre == 'Apex Legends') {
                          Navigator.popAndPushNamed(context, 'apex');
                        }
                      },
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
          Navigator.pushReplacementNamed(context, 'login');
        },
        child: Icon(Icons.logout),
        backgroundColor: Color.fromRGBO(13, 20, 35, 1),
      ),
    );
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = [];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
            // In the false case
            (element) => element.contains(query),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
