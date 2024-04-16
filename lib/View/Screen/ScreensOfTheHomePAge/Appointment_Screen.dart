import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AppointmentScreens/CancelledScreen.dart';
import '../AppointmentScreens/CompletedScreen.dart';
import '../AppointmentScreens/UpcomingScreen.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("myBookings".tr),
          ),
          bottom: TabBar(tabs: <Widget>[
            Tab(text: "Upcoming".tr),
            Tab(text: "Completed".tr),
            Tab(text: "Cancelled".tr),
          ]),
        ),
        body: TabBarView(
          children: [
            UpComingScreen(),
            CompletedScreen(),
            CancelledScreen(),
          ],
        ),
      ),
    );
  }
}
