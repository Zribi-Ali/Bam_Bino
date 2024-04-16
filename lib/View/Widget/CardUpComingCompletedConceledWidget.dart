import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/Classes/appointment_model.dart';
import '../../Setting/Colors/colorsSetting.dart';
import 'DoctorListCardWidget.dart';
import 'TextStyle.dart';

Widget CardUpComingCompletedConceledWidget(Appointment appointment, int index) {
  return Card(
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 0, 0),
          child: Text(
            "${appointment.fistDate.toString()} - ${appointment.hour.toString()}",
            style: Style().styleText,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
          child: Divider(
            thickness: 1,
            color: ConstantColor().grey2,
          ),
        ),
        SizedBox(
          height: Get.height * .24,
          child: DoctorListCardWidget(appointment.doctor!, Get.width),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            thickness: 2,
            color: ConstantColor().grey2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade300),
                  ),
                  child: Text(
                    "Cancel".tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blueGrey.shade700),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Reschedule".tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blueGrey.shade700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
