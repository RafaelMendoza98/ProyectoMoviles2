import 'package:flutter/material.dart';
import 'package:proyecto_tecnologias_moviles_2/widgets/wid_button.dart';
import 'package:proyecto_tecnologias_moviles_2/widgets/wid_input.dart';

class RadioPago extends StatefulWidget {
  RadioPago({Key? key}) : super(key: key);

  @override
  _RadioPagoState createState() => _RadioPagoState();
}

class _RadioPagoState extends State<RadioPago> {
  

  @override
  Widget build(BuildContext context) {
    final targeta = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Metodo de pago'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: Text('MasterCard'),
                tileColor: Colors.blue,
                leading: Radio(
                  value: 1,
                  groupValue: 1,
                  
                  
                  onChanged: (val) {
                    print('MasterCard ${val}');
                  })),
              RadioListTile(
                  value: 1,
                  groupValue: 1,
                  title: Text('Debito'),
                  tileColor: Colors.blue,
                  onChanged: (val) {
                    print('Debito ${val}');
                  }),
              WidInput(
                  icono: Icons.card_giftcard_outlined,
                  placeHolder: 'Numero de targeta',
                  textController: targeta),
              WidButton(
                  texto: 'Realizar Compra',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'compras');
                  }),
            ],
          )
        ],
      ),
    );
  }
}
