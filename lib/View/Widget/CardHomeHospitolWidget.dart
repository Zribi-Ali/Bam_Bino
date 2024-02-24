import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Setting/Colors/colorsSetting.dart';

Card CardHomeHospitolWidget(image, name) {
  return Card(
    elevation: 0,
    color: Colors.white,
    shadowColor: ConstantColor().grey2,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image,
            height: Get.height * .18,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 18,
                color: ConstantColor().darkblue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
