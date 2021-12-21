import 'package:flutter/material.dart';
import 'package:proyecto_tecnologias_moviles_2/utils/list.dart';
import 'package:proyecto_tecnologias_moviles_2/utils/string_to_icon.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_tecnologias_moviles_2/global/environment.dart';

class HomePage extends StatefulWidget {
  final opciones = [
    'GTA V',
    'GTA IV',
    'FIFA22',
    'WWE 2K22',
    'DRAGON BALL XENOVERSE 2'
  ];

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 47, 40, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13, 20, 35, 1),
        actions: <Widget>[
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
      body: listView(),
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

Widget listView() {
  return FutureBuilder(
      future: listprovider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: listaItems(snapshot.data!),
        );
      });
}

List<Widget> listaItems(List<dynamic> data) {
  final List<Widget> opciones = [];
  data.forEach((element) {
    final widgTemp = ListTile(
      title: Text(element['texto']),
      leading: getIcon(element['icono']),
      onTap: () {},
    );
    opciones.add(widgTemp);
  });

  return opciones;
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
