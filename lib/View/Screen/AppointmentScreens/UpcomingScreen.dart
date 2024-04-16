import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Model/Classes/appointment_model.dart';
import '../../../Setting/Lists/appointmentList.dart';
import '../../Widget/CardUpComingCompletedConceledWidget.dart';

class UpComingScreen extends StatefulWidget {
  const UpComingScreen({super.key});

  @override
  State<UpComingScreen> createState() => _UpComingScreenState();
}

class _UpComingScreenState extends State<UpComingScreen> {
  @override
  Widget build(BuildContext context) {
    AppointmentList _appointmentList = AppointmentList();
    return Scaffold(
      body: Center(
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
                    child: SizedBox(
                      height: Get.height * .43,
                      child: CardUpComingCompletedConceledWidget(
                          snapshot.data![index], index),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
