import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:table_calendar/table_calendar.dart';

import '../../../Setting/Colors/colorsSetting.dart';
import '../../Widget/CicleBirth.dart';

import '../../Widget/ConseilleWidget.dart';
import '../../Widget/TextStyle.dart';
import '../home/Fondatteur.dart';

class PreConnexionScreen extends StatefulWidget {
  const PreConnexionScreen({super.key});

  @override
  State<PreConnexionScreen> createState() => _PreConnexionScreenState();
}

class _PreConnexionScreenState extends State<PreConnexionScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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

  int differenceMois(DateTime date1, DateTime date2) {
    int moisDifference = 0;

    while (date1.isAfter(date2)) {
      date2 = date2.add(const Duration(days: 30)); // Environ 30 jours par mois
      moisDifference++;
    }

    return moisDifference;
  }

  List<String> con1 = ["conseille1".tr];
  List<String> con2 = ["conseille4".tr];
  List<String> con3 = ["conseille7".tr];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
              const SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: birthDate == ""
                      ? const SizedBox(
                          height: 10,
                        )
                      : build_CircleBirth(
                          birthDate, context, currentWeekNumber, birthInWeeks)),
              const SizedBox(
                height: 40,
              ),
              LastDateController.text != ""
                  ? differenceEnMois == 1
                      ? Center(child: buildConseille(con1[0], 0))
                      : differenceEnMois == 2
                          ? Center(child: buildConseille(con2[0], 0))
                          : Center(child: buildConseille(con3[0], 0))
                  : const SizedBox(
                      height: 5,
                      width: double.infinity,
                    ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .08,
                width: double.infinity,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.offNamed("/login");
          },
          backgroundColor: ConstantColor().blue,
          label: Text(
            "conx".tr,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
