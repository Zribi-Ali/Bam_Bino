import 'package:bambino/View/Widget/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../Model/Classes/doctor_model.dart';
import '../../Setting/Colors/colorsSetting.dart';

Widget DoctorListCardWidget(Doctor doctor, width) {
  return Card(
    color: Colors.white,
    elevation: 0,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        doctor.photo!,
                      ),
                    ),
                  ),
                  height: width * .5,
                  width: width * .33,
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 20, 6, 8),
                child: Text(
                  doctor.fullName!,
                  style: Style().styleDoctorName,
                ),
              ),
              SizedBox(
                width: Get.width * .45,
                child: Divider(
                  color: ConstantColor().grey2,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  doctor.speciality!,
                  style: Style().styleDoctorSpecialite,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                    child: Icon(
                      Ionicons.location_outline,
                      size: 22,
                      color: ConstantColor().grey4,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
                    child: Text(
                      doctor.lacation!,
                      style: Style().stylelocation,
                    ),
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
