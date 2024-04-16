import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../Setting/Colors/colorsSetting.dart';
import 'TextStyle.dart';

Widget buildCircleBirth(text, context, currentWeekNumber, birthInWeeks) {
  return ClipOval(
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).width * .9,
      decoration: BoxDecoration(
        color: ConstantColor().blue.withOpacity(.7),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(.1),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(3, 1), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * .1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "youarein".tr,
                  style: Style().styleTextDescriptionAccouchement,
                ),
                Text(
                  "$currentWeekNumber",
                  style: Style().styleTextDescriptionAccouchement,
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            birthInWeeks > 1
                ? Row(
                    children: [
                      Text(
                        "$birthInWeeks ",
                        style: Style().styleTextDescriptionAccouchement,
                      ),
                      Text(
                        "weeksleft".tr,
                        style: Style().styleTextDescriptionAccouchement,
                      ),
                    ],
                  )
                : Text(
                    "OneWeekleft".tr,
                    style: Style().styleTextDescriptionAccouchement,
                  ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  "DateAaccouchment".tr,
                  style: Style().styleTextDescriptionAccouchement,
                ),
                Text(
                  text,
                  style: Style().styleTextDescriptionAccouchement,
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget build_CircleBirth(text, context, currentWeekNumber, birthInWeeks) {
  return SizedBox(
    // width: MediaQuery.sizeOf(context).width * .82,
    height: MediaQuery.sizeOf(context).height * .33,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          right: MediaQuery.sizeOf(context).width * .1,
          //top: 0,
          child: ClipOval(
            child: Container(
              width: MediaQuery.sizeOf(context).width * .7,
              height: MediaQuery.sizeOf(context).width * .6,
              decoration: BoxDecoration(
                color: ConstantColor().blue.withOpacity(.7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(.1),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(3, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Transform.rotate(
                  angle: 0.03,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "DateAaccouchment".tr,
                        style: Style().styleTextDescriptionAccouchement,
                      ),
                      Text(
                        text,
                        style: Style().styleTextDescriptionAccouchement,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: ClipOval(
            child: Container(
              width: MediaQuery.sizeOf(context).width * .33,
              height: MediaQuery.sizeOf(context).width * .28,
              decoration: BoxDecoration(
                color: ConstantColor().pink.withOpacity(.7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(.1),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(3, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Transform.rotate(
                  angle: 0.03,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "youarein".tr,
                        style: Style().styleTextDescriptionAccouchement,
                      ),
                      Text(
                        " : $currentWeekNumber",
                        style: Style().styleTextDescriptionAccouchement,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: ClipOval(
            child: Container(
              width: MediaQuery.sizeOf(context).width * .34,
              height: MediaQuery.sizeOf(context).width * .28,
              decoration: BoxDecoration(
                color: ConstantColor().pink.withOpacity(.7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(.1),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(3, 1), // changes position of shadow
                  ),
                ],
              ),
              child: birthInWeeks > 1
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$birthInWeeks ",
                          style: Style().styleTextDescriptionAccouchement,
                        ),
                        Text(
                          "weeksleft".tr,
                          style: Style().styleTextDescriptionAccouchement,
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        "OneWeekleft".tr,
                        style: Style().styleTextDescriptionAccouchement,
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
          ),
        ),
      ],
    ),
  );
}
