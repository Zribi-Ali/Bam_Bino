// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:bambino/Model/Hospital.dart';
import 'package:bambino/Model/doctor_model.dart';
import 'package:bambino/Setting/Lists/DoctorList.dart';
import 'package:bambino/Setting/Lists/Hospitals.dart';
import 'package:bambino/View/Widget/TextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Setting/Colors/colorsSetting.dart';
import '../../Widget/CardHomeDoctor_Widget.dart';
import '../../Widget/CardHomeHospitolWidget.dart';
import '../../Widget/DoctorListCardWidget.dart';
import '../../Widget/InputFilde_Widget.dart';
import 'Doctor&Appointment/DoctorDetails_Screen.dart';
import 'Doctor&Appointment/DoctorList_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List conseiller = [
    "conseille1".tr,
    "conseille2".tr,
    "conseille3".tr,
    "conseille4".tr,
    "conseille5".tr,
    "conseille6".tr,
    "conseille7".tr,
    "conseille8".tr,
    "conseille9".tr,
    "conseille10".tr,
  ];

  late int randomNumber;
  void random() {
    Random random = Random();
    randomNumber = random.nextInt(8);
  }

  PageController _controller = PageController();
  TextEditingController LastDateController = TextEditingController();
  DateTime dateActuelle = DateTime.now();
  String birthDate = "";
  final format = DateFormat("yyyy-MM-dd");
  DateTime selectedDate = DateTime.now();
  int differenceEnMois = 10;
  void addMonths(date) {
    birthDate = format.format(date
        .add(const Duration(days: 7))
        .subtract(const Duration(days: 3 * 31)));
    //birthDate = format.format(date.add(Duration(days: 280)));
    differenceEnMois = differenceMois(dateActuelle, selectedDate);
    setState(() {});
  }

  int differenceMois(DateTime date1, DateTime date2) {
    int moisDifference = 0;

    while (date1.isAfter(date2)) {
      date2 = date2.add(const Duration(days: 30)); // Environ 30 jours par mois
      moisDifference++;
    }

    return moisDifference;
  }

  @override
  void initState() {
    random();
    super.initState();
  }

/*       if (publication.content.length > 50) {
      firstHalf = publication.content.substring(0, 50);
      secondHalf =
          publication.content.substring(50, publication.content.length);
    } else {
      firstHalf = publication.content;
      secondHalf = "";
    }
 */
  @override
  Widget build(BuildContext context) {
    HospitalList _hospitalList = HospitalList();
    DoctorList _doctorList = DoctorList();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: Get.height * 0.25,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        PageView(
                          controller: _controller,
                          onPageChanged: (indexPage) {},
                          children: [
                            cardHomeDoctorImageWidget("assets/Image8.png"),
                            cardHomeDoctorImageWidget("assets/Image8.png"),
                            cardHomeDoctorImageWidget("assets/Image8.png")
                          ],
                        ),
                        Container(
                          alignment: const Alignment(0, 0.9),
                          child: SmoothPageIndicator(
                            controller: _controller,
                            count: 3,
                            effect: ExpandingDotsEffect(
                                dotColor: ConstantColor().grey1,
                                activeDotColor: ConstantColor().grey2,
                                dotHeight: 10,
                                dotWidth: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
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
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: birthDate == ""
                        ? const Text(
                            "Date d'accouchment : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        : Text(
                            "Date d'accouchment : $birthDate",
                          ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  LastDateController.text != ""
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: differenceEnMois >= 0 && differenceEnMois <= 3
                              ? Column(
                                  children: [
                                    Text("conseille1".tr),
                                    Text("conseille2".tr),
                                    Text("conseille3".tr),
                                  ],
                                )
                              : differenceEnMois >= 4 && differenceEnMois <= 6
                                  ? Column(
                                      children: [
                                        Text("conseille4".tr),
                                        Text("conseille5".tr),
                                        Text("conseille6".tr),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Text("conseille7".tr),
                                        Text("conseille8".tr),
                                        Text("conseille9".tr),
                                      ],
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
                      onPressed: () {}, //here ********************************
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .28,
                    child: FutureBuilder<List<Hospital>>(
                      future: Future.value(_hospitalList.hospital),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
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
                                builder: (context) =>
                                    const DoctorListScreen()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .25,
                    //width: Get.width,
                    child: FutureBuilder<List<Doctor>>(
                      future: Future.value(_doctorList.doctors),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
      ),
    );
  }
}
