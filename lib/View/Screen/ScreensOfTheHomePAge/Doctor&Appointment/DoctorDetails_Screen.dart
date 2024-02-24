import 'package:bambino/Model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widget/DoctorCard_Widget.dart';
import '../../../Widget/TextStyle.dart';

// ignore: must_be_immutable
class DoctorDetailsScreen extends StatefulWidget {
  DoctorDetailsScreen({super.key, required this.doctor});
  Doctor doctor = Doctor();

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Dr, ${widget.doctor.fullName}")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorCardWidget(
                doctor: widget.doctor,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "WorkingTime".tr,
                style: Style().styleBoldTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(widget.doctor.workTime!),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Aboutme".tr,
                style: Style().styleBoldTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(widget.doctor.about!),
            ],
          ),
        ),
      ),
    );
  }
}
