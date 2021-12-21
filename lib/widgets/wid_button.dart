import 'package:flutter/material.dart';

class WidButton extends StatelessWidget {
  final String texto;
  final void Function() onPressed;
  const WidButton({
    Key? key,
    required this.texto,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          primary: Color.fromRGBO(13, 20, 35, 1),
          shape: StadiumBorder(),
        ),
        onPressed: onPressed,
        child: Container(
          height: 40,
          width: double.infinity,
          child: Center(
            child: Text(
              texto,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
