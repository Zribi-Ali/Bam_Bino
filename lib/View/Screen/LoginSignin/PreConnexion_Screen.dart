import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Setting/Colors/colorsSetting.dart';
import '../../Widget/CardHomeDoctor_Widget.dart';
import '../../Widget/InputFilde_Widget.dart';

class PreConnexionScreen extends StatefulWidget {
  const PreConnexionScreen({super.key});

  @override
  State<PreConnexionScreen> createState() => _PreConnexionScreenState();
}

class _PreConnexionScreenState extends State<PreConnexionScreen>
    with SingleTickerProviderStateMixin {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    startAutoScroll(); // Call this method when you want auto-scrolling to begin
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> startAutoScroll() async {
    await Future.delayed(const Duration(seconds: 5) // Adjust duration as needed
        );
    if (mounted) {
      setState(() {
        controller.animateToPage(
          1, // Specify the target page number here
          curve: Curves.easeInOut,
          duration: const Duration(
              seconds: 1), // Adjust animation duration as desired
        );
      });
    }
  }

  final format = DateFormat("yyyy-MM-dd");
  DateTime selectedDate = DateTime.now();
  TextEditingController LastDateController = TextEditingController();

  String birthDate = "";
  void addMonths(date) {
    birthDate = format
        .format(date.add(Duration(days: 7)).subtract(Duration(days: 3 * 31)));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: Get.height * 0.35,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        PageView(
                          controller: controller,
                          onPageChanged: (indexPage) {
                            if (indexPage == 2) {
                              Future.delayed(const Duration(seconds: 2), () {
                                if (mounted) {
                                  controller.animateToPage(
                                    0,
                                    duration: const Duration(seconds: 2),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              });
                            }
                          },
                          children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Image.asset(
                                  width: Get.height * 0.32,
                                  height: Get.height * 0.35,
                                  "assets/Fondateur.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            cardHomeDoctorTextWidget("Fondateur1".tr),
                            cardHomeDoctorTextWidget("Fondateur2".tr),
                          ],
                        ),
                        Container(
                          alignment: const Alignment(0, 0.9),
                          child: SmoothPageIndicator(
                            controller: controller,
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
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      Text("conseille1".tr),
                      Text("conseille2".tr),
                      Text("conseille3".tr),
                    ],
                  ),
                ),
              ],
            ),
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
