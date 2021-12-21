import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_tecnologias_moviles_2/routes/routes.dart';
import 'package:proyecto_tecnologias_moviles_2/services/authenticator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthService()
          ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Game Store',
      initialRoute: 'login',
      routes: appRoutes,
      ),
    );
  }
}
                             