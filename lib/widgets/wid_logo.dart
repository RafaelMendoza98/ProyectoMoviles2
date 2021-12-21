import 'package:flutter/material.dart';

class WidLogo extends StatelessWidget {
  final String texto;
  const WidLogo({
    Key? key,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Image(image: AssetImage('assets/logo.png')),
            SizedBox(
              height: 20,
            ),
            Text(
              texto,
              style: TextStyle(fontSize: 25, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
