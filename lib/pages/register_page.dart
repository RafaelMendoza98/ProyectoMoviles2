import 'package:provider/provider.dart';
import 'package:proyecto_tecnologias_moviles_2/helpers/mostrarAlerta.dart';
import 'package:proyecto_tecnologias_moviles_2/services/authenticator.dart';
import 'package:proyecto_tecnologias_moviles_2/widgets/wid_button.dart';
import 'package:proyecto_tecnologias_moviles_2/widgets/wid_input.dart';
import 'package:proyecto_tecnologias_moviles_2/widgets/wid_label.dart';
import 'package:proyecto_tecnologias_moviles_2/widgets/wid_logo.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Container(
            //Toda la pantalla
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                WidLogo(texto: 'Crear mi Cuenta\n'),
                _Form(),
                WidLabel(
                  texto: 'Crear Cuenta',
                  color: Color.fromRGBO(146, 184, 31, 1),
                  ruta: 'login',
                  Texto: '',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'login');
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
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nombreCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Column(
      children: [
        WidInput(
          icono: Icons.people_outline,
          placeHolder: 'Nombre',
          keyboardType: TextInputType.text,
          textController: nombreCtrl,
        ),
        WidInput(
          icono: Icons.mail_outline,
          placeHolder: 'Email',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
        ),
        WidInput(
          icono: Icons.lock_outline,
          placeHolder: 'Contraseña',
          keyboardType: TextInputType.text,
          textController: passCtrl,
          isPassword: true,
        ),
        WidButton(
          texto: 'crear',
          onPressed: authService.autenticando
              ? () => {}
              : () async {
                  final registro = await authService.crearUsusrios(
                    nombreCtrl.text,
                    emailCtrl.text,
                    passCtrl.text,
                  );
                  if (registro == true) {
                    Navigator.pushReplacementNamed(context, 'login');
                  } else {
                    mostrarAlerta(context, 'Registro Incorrecto', registro);
                  }
                },
        )
      ],
    );
  }
}
