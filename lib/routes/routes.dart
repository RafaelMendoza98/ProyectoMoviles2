import 'package:flutter/material.dart';
import 'package:proyecto_tecnologias_moviles_2/Page_juegos/WOFT.dart';
import 'package:proyecto_tecnologias_moviles_2/Page_juegos/gtaV.dart';
import 'package:proyecto_tecnologias_moviles_2/Page_juegos/apex.dart';
import 'package:proyecto_tecnologias_moviles_2/page_pago/metodo_pago_page.dart';
import 'package:proyecto_tecnologias_moviles_2/pages/carrito_page.dart';
import 'package:proyecto_tecnologias_moviles_2/pages/home_page.dart';
import 'package:proyecto_tecnologias_moviles_2/pages/lista_Juegos.dart';
import 'package:proyecto_tecnologias_moviles_2/pages/login_page.dart';
import 'package:proyecto_tecnologias_moviles_2/pages/register_page.dart';
import 'package:proyecto_tecnologias_moviles_2/pages/compras.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'homepage': (_) => HomePage(),
  'listaJuegos': (_) => ListaJuegos(),
  'compras': (_) => ComprasPage(),
  'mostrarjuegos': (_) => GtavPage(),
  'carrito': (_) => CarritoPage(),
  'wof': (_) => WofPage(),
  'RadioPago': (_) => RadioPago(),
  'apex': (_) => ApexPage(),
};
