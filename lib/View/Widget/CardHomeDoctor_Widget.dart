import 'package:bambino/Setting/Colors/colorsSetting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'TextStyle.dart';

Card cardHomeDoctorImageWidget(String image) {
  return Card(
    elevation: 1,
    shadowColor: ConstantColor().grey2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Image.asset(
            width: double.infinity,
            height: Get.height * 0.25,
            image,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: -(Get.width * 0.2),
            left: -(Get.width * 0.2),
            child: ClipOval(
              child: Container(
                height: Get.width * 0.5,
                width: Get.width * 0.5,
                color: Colors.grey.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Card cardHomeDoctorTextWidget(String text) {
  return Card(
    elevation: 1,
    shadowColor: ConstantColor().grey2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xff284f51),
                  Color(0xff468680),
                  Color(0xff65A299)
                ], // Replace with your desired colors
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                text,
                style: Style().styleTextDescription,
              ),
            ),
          ),
          Positioned(
            top: -(Get.width * 0.2),
            left: -(Get.width * 0.2),
            child: ClipOval(
              child: Container(
                height: Get.width * 0.5,
                width: Get.width * 0.5,
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
