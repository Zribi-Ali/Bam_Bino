import 'package:bambino/Setting/Colors/colorsSetting.dart';
import 'package:flutter/material.dart';

class Style {
  TextStyle styleBoldTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: ConstantColor().darkbluedark,
  );

  TextStyle styleDoctorName = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ConstantColor().darkbluedark,
  );

  TextStyle styleDoctorSpecialite = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: ConstantColor().grey2,
  );

  TextStyle stylelocation = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ConstantColor().grey4,
  );

  TextStyle styleDate = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: ConstantColor().darkbluedark,
  );

  TextStyle styleBold1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: ConstantColor().darkbluedark,
  );

  TextStyle styleW4001 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ConstantColor().listTile,
  );

  TextStyle styleBoldDiscription = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: ConstantColor().grey4,
  );

  TextStyle styleListTile = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: ConstantColor().listTile,
  );

  TextStyle styleTextButton = const TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 46, 113, 228),
    fontWeight: FontWeight.w700,
  );

  TextStyle styleText = TextStyle(
    fontSize: 14,
    color: ConstantColor().darkbluedark,
    fontWeight: FontWeight.w700,
  );

  TextStyle styleTextGray = TextStyle(
    fontSize: 14,
    color: ConstantColor().grey2,
    fontWeight: FontWeight.w700,
  );

  TextStyle styleTextDescription = const TextStyle(
    fontSize: 15,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  TextStyle styleTextDescriptionFondateur = const TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle styleTextDescriptionAccouchement = const TextStyle(
      fontSize: 13,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      letterSpacing: 1);
}
