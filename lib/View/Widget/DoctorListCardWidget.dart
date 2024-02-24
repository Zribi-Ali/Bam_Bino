import 'package:bambino/View/Widget/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../Model/doctor_model.dart';
import '../../Setting/Colors/colorsSetting.dart';

Widget DoctorListCardWidget(Doctor doctor, width) {
  return Card(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                doctor.photo!,
                height: width * .5,
                width: width * .35,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: Text(
                  doctor.fullName!,
                  style: Style().styleBoldTitle,
                ),
              ),
              Divider(
                color: ConstantColor().grey2,
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  doctor.speciality!,
                  style: Style().styleListTile,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                    child: Icon(Ionicons.location_outline),
                  ),
                  Text(
                    doctor.lacation!,
                    style: Style().styleBoldTitle,
                  ),
                ],
              ),
              /* Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        doctor.rating! < 4.5
                            ? Icon(
                                Ionicons.star_half_outline,
                                color: ConstantColor().starColor,
                              )
                            : Icon(
                                Ionicons.star_outline,
                                color: ConstantColor().starColor,
                              ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text("${doctor.rating!}"),
                        ),
                      ],
                    ),
                    Text("${doctor.reviews!} Reviews")
                  ],
                ),
              ), */
            ],
          )
        ],
      ),
    ),
  );
}
