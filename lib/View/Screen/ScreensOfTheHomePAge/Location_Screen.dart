import 'package:bambino/Model/Classes/appointment_model.dart';
import 'package:bambino/Setting/Lists/appointmentList.dart';
import 'package:bambino/View/Widget/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Setting/Colors/colorsSetting.dart';
import '../../Widget/CardAppointment_Widget.dart';

class QuarterlyAppointmentScreen extends StatefulWidget {
  const QuarterlyAppointmentScreen({super.key});

  @override
  State<QuarterlyAppointmentScreen> createState() =>
      _QuarterlyAppointmentScreenState();
}

class _QuarterlyAppointmentScreenState
    extends State<QuarterlyAppointmentScreen> {
  AppointmentList _appointmentList = AppointmentList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "appointment".tr,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: ConstantColor().darkbluedark,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          //color: ConstantColor().pink.withOpacity(.7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "listeappointment".tr,
                  style: Style().styleW4001,
                ),
              ),
              SizedBox(
                height: Get.height * .75,
                child: FutureBuilder<List<Appointment>>(
                  future: Future.value(_appointmentList.appointment),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListView.builder(
                        itemCount: _appointmentList.appointment.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CardAppointmentWidget(
                                snapshot.data![index], index),
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
