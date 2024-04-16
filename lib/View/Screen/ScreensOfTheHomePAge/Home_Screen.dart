// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:bambino/Setting/Lists/DoctorList.dart';
import 'package:bambino/Setting/Lists/Hospitals.dart';
import 'package:bambino/View/Widget/TextStyle.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
//import 'package:ionicons/ionicons.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Model/Classes/Hospital.dart';
import '../../../Model/Classes/doctor_model.dart';
import '../../../Setting/Colors/colorsSetting.dart';
import '../../Widget/CardHomeHospitolWidget.dart';
import '../../Widget/CicleBirth.dart';
import '../../Widget/ConseilleWidget.dart';
import '../../Widget/DoctorListCardWidget.dart';
//import '../../Widget/InputFilde_Widget.dart';
import '../home/Fondatteur.dart';
import 'Doctor&Appointment/DoctorDetails_Screen.dart';
import 'Doctor&Appointment/DoctorList_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int randomNumber;
  void random() {
    Random random = Random();
    randomNumber = random.nextInt(8);
  }

  TextEditingController LastDateController = TextEditingController();

  String birthDate = "";
  int birthInWeeks = 0;
  final format = DateFormat("yyyy-MM-dd");
  DateTime selectedDate = DateTime.now();

  int differenceEnMois = 0;
  int currentWeekNumber = 0;
  void addMonths(date) {
    birthDate = format.format(date
        .add(const Duration(
          days: 372,
        ))
        .subtract(const Duration(days: 3 * 31)));

    DateTime currentDate = DateTime.now();
    DateTime selectedBirthDate = DateTime.parse(birthDate);
    int ageInDays = currentDate.difference(selectedBirthDate).inDays * -1;
    birthInWeeks = ageInDays ~/ 7;

    // Calculate the current week number
    int daysSinceSelected = currentDate.difference(date).inDays;
    currentWeekNumber = (daysSinceSelected / 7).ceil();
    if ((0 < currentWeekNumber) && (currentWeekNumber <= 12)) {
      differenceEnMois = 1;
    } else if ((12 < currentWeekNumber) && (currentWeekNumber <= 25)) {
      differenceEnMois = 2;
    } else {
      differenceEnMois = 3;
    }

    setState(() {});
  }

  @override
  void initState() {
    random();
    super.initState();
  }

  List<String> con1 = ["conseille1".tr, "conseille2".tr, "conseille3".tr];
  List<String> con2 = ["conseille4".tr, "conseille5".tr, "conseille6".tr];
  List<String> con3 = ["conseille7".tr, "conseille8".tr, "conseille9".tr];

  @override
  Widget build(BuildContext context) {
    HospitalList hospitalList = HospitalList();
    DoctorList doctorList = DoctorList();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ConstantColor().pink.withOpacity(.2),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Fondateur(),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "lastdate".tr,
                        style: Style().styleBold1,
                      ),
                      TableCalendar(
                        focusedDay: selectedDate,
                        locale: Localizations.localeOf(context).languageCode,
                        firstDay: DateTime(2023),
                        lastDay: DateTime.now(),
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                        ),
                        calendarStyle: CalendarStyle(
                          todayDecoration: BoxDecoration(
                            color: ConstantColor().blue,
                            shape: BoxShape.circle,
                          ),
                          selectedDecoration: BoxDecoration(
                            color: ConstantColor().pink,
                            shape: BoxShape.circle,
                          ),
                        ),
                        availableGestures: AvailableGestures.all,
                        weekNumbersVisible: true,
                        daysOfWeekHeight: 24,
                        //calendarFormat: CalendarFormat.month,
                        selectedDayPredicate: (DateTime date) {
                          return isSameDay(selectedDate, date);
                        },
                        onDaySelected:
                            (DateTime selectedDay, DateTime focusedDay) {
                          setState(() {
                            selectedDate = selectedDay;
                            LastDateController.text =
                                DateFormat("yyyy-MM-dd").format(selectedDate);
                            addMonths(selectedDay);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                /* Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: TextField(
                    readOnly: true,
                    textInputAction: TextInputAction.none,
                    controller: LastDateController,
                    decoration: DecorationWidget(
                      context,
                      "lastdate".tr,
                      Ionicons.calendar,
                    ),
                    onTap: () async {
                      {
                        final DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2050));
                        if (dateTime != null) {
                          setState(() {
                            selectedDate = dateTime;
                            LastDateController.text =
                                DateFormat("yyyy-MM-dd").format(selectedDate);
                          });
                        }
                      }
                      addMonths(selectedDate);
                    },
                  ),
                ), */
                const SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: birthDate == ""
                        ? const SizedBox(
                            height: 10,
                          )
                        : build_CircleBirth(birthDate, context,
                            currentWeekNumber, birthInWeeks)),
                const SizedBox(
                  height: 30,
                ),
                LastDateController.text != ""
                    ? differenceEnMois == 1
                        ? Center(
                            child: CarouselSlider.builder(
                              itemCount: con1.length,
                              itemBuilder: (context, index, realIndex) {
                                return buildConseille(con1[index], index);
                              },
                              options: CarouselOptions(
                                height: MediaQuery.sizeOf(context).height * .43,
                              ),
                            ),
                          )
                        : differenceEnMois == 2
                            ? Center(
                                child: CarouselSlider.builder(
                                  itemCount: con2.length,
                                  itemBuilder: (context, index, realIndex) {
                                    return buildConseille(con2[index], index);
                                  },
                                  options: CarouselOptions(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              .4),
                                ),
                              )
                            : Center(
                                child: CarouselSlider.builder(
                                  itemCount: con3.length,
                                  itemBuilder: (context, index, realIndex) {
                                    return buildConseille(con3[index], index);
                                  },
                                  options: CarouselOptions(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              .4),
                                ),
                              )
                    : const SizedBox(
                        height: 5,
                        width: double.infinity,
                      ),
                ListTile(
                  leading: Text(
                    "Centres".tr,
                    style: Style().styleBold1,
                  ),
                  trailing: TextButton(
                    child: Text(
                      "SeeAll".tr,
                      style: Style().styleW4001,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: Get.width * .5,
                  child: FutureBuilder<List<Hospital>>(
                    future: Future.value(hospitalList.hospital),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hospitalList.hospital.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: CardHomeHospitolWidget(
                                  snapshot.data![index].image,
                                  snapshot.data![index].name),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
                ListTile(
                  leading: Text(
                    "Doctors".tr,
                    style: Style().styleBold1,
                  ),
                  trailing: TextButton(
                    child: Text(
                      "SeeAll".tr,
                      style: Style().styleW4001,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DoctorListScreen()));
                    },
                  ),
                ),
                SizedBox(
                  height: Get.height * .25,
                  //width: Get.width,
                  child: FutureBuilder<List<Doctor>>(
                    future: Future.value(doctorList.doctors),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DoctorDetailsScreen(
                                      doctor: snapshot.data![index],
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DoctorListCardWidget(
                                    snapshot.data![index], Get.width),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
