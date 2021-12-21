import 'package:flutter/material.dart';

class WidLabel extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String Texto;
  final Color color;
  const WidLabel(
      {Key? key,
      // ignore: non_constant_identifier_names
      required this.Texto,
      required this.color,
      String? texto,
      String? ruta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            child: Text(
              Texto,
              style: TextStyle(
                  color: color, fontSize: 20, fontWeight: FontWeight.w100),
            ),
          )
        ],
      ),
    );
  }
}
