import 'dart:ui';

import 'package:bambino/Model/Classes/appointment_model.dart';
import 'package:bambino/Setting/Colors/colorsSetting.dart';
import 'package:bambino/View/Widget/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Widget CardAppointmentWidget(Appointment appointment, int index) {
  return Container(
    decoration: BoxDecoration(
      color: index % 2 == 0
          ? ConstantColor().blue.withOpacity(.7)
          : ConstantColor().pink.withOpacity(.7),
      borderRadius: BorderRadius.circular(12),
    ),
    child: ClipRRect(
      borderRadius: GetStorage().read('lang') == 'ar'
          ? const BorderRadius.only(
              topLeft: Radius.circular(140),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            )
          : const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(140),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 25,
                sigmaY: 25,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(.13),
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white54, Colors.white70],
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 25,
                        spreadRadius: -2),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 3.5,
                            color: ConstantColor().blue,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "nbappointment".tr,
                            style: Style().styleW4001,
                          ),
                          Text(
                            appointment.appointmentNumber.toString(),
                            style: Style().styleW4001,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: GetStorage().read('lang') == 'ar'
                          ? const EdgeInsets.fromLTRB(150, 0, 6, 2)
                          : const EdgeInsets.fromLTRB(6, 0, 150, 2),
                      child: Divider(
                        color: ConstantColor().grey4,
                        thickness: 2,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "dateappointment".tr,
                        style: Style().styleTextGray,
                      ),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            appointment.fistDate!,
                            style: Style().styleDate,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "||",
                            style: Style().styleDate,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            appointment.secendDate!,
                            style: Style().styleDate,
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      subtitle: Row(
                        children: [
                          Text("weekappointment".tr, style: Style().styleText),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            appointment.weekBirth.toString(),
                            style: Style().styleText,
                          ),
                        ],
                      ),
                      trailing: Container(
                        height: Get.width * .08,
                        width: Get.width * .2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index % 2 == 0
                              ? ConstantColor().pink.withOpacity(.7)
                              : ConstantColor().blue.withOpacity(.7),
                        ),
                        child: Center(
                          child: Text(
                            appointment.hour.toString(),
                            style: Style().styleDate,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget CardAppointmentWidget1(Appointment appointment, int index) {
  return Container(
    /* decoration: BoxDecoration(
      color: index % 2 == 0
          ? ConstantColor().blue.withOpacity(.7)
          : ConstantColor().pink.withOpacity(.7),
      borderRadius: BorderRadius.circular(12),
    ), */
    child: ClipRRect(
      borderRadius: GetStorage().read('lang') == 'ar'
          ? const BorderRadius.only(
              topLeft: Radius.circular(140),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            )
          : const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(140),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 25,
                sigmaY: 25,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withOpacity(.5),
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white12, Colors.white60],
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 12,
                        spreadRadius: -2),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 3.5,
                            color: ConstantColor().blue,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "nbappointment".tr,
                            style: Style().styleW4001,
                          ),
                          Text(
                            appointment.appointmentNumber.toString(),
                            style: Style().styleW4001,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              height: 10,
                              width: 10,
                              color: ConstantColor().pink.withOpacity(.7),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: GetStorage().read('lang') == 'ar'
                          ? const EdgeInsets.fromLTRB(150, 0, 6, 2)
                          : const EdgeInsets.fromLTRB(6, 0, 150, 2),
                      child: Divider(
                        color: ConstantColor().grey4,
                        thickness: 2,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "dateappointment".tr,
                        style: Style().styleTextGray,
                      ),
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            appointment.fistDate!,
                            style: Style().styleDate,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "||",
                            style: Style().styleDate,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            appointment.secendDate!,
                            style: Style().styleDate,
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      subtitle: Row(
                        children: [
                          Text("weekappointment".tr, style: Style().styleText),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            appointment.weekBirth.toString(),
                            style: Style().styleText,
                          ),
                        ],
                      ),
                      trailing: Container(
                        height: Get.width * .08,
                        width: Get.width * .2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index % 2 == 0
                              ? ConstantColor().pink.withOpacity(.7)
                              : ConstantColor().blue.withOpacity(.7),
                        ),
                        child: Center(
                          child: Text(
                            appointment.hour.toString(),
                            style: Style().styleDate,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
