import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Widget CardHomeHospitolWidget(image, name) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: Get.height * .24,
          width: Get.width * .85,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
                alignment: const Alignment(-0.3, 0)),
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.7, 1]),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
