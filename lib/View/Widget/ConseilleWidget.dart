import 'package:flutter/material.dart';

import '../../Setting/Colors/colorsSetting.dart';

Widget buildConseille(text, index) {
  return Container(
    margin: const EdgeInsets.all(4),
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ConstantColor().blue.withOpacity(0.2),
            ConstantColor().pink.withOpacity(0.3)
          ],
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.pink,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: ConstantColor().pink.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(2, 2),
          )
        ]),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: SingleChildScrollView(
        child: Text(text),
      ),
    ),
  );
}
