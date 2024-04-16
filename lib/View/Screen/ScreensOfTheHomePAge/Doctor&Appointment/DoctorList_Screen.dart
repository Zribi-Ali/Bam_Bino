import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Model/Classes/doctor_model.dart';
import '../../../../Setting/Colors/colorsSetting.dart';
import '../../../../Setting/Lists/DoctorList.dart';
import '../../../Widget/DoctorCard_Widget.dart';

class DoctorListScreen extends StatefulWidget {
  const DoctorListScreen({super.key});

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  DoctorList _doctor = DoctorList();

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: inputFidlRecher(),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: SizedBox(
                    height: Get.height * 0.07,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _selectedIndex = 0;
                                });
                              },
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(0),
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      color: ConstantColor().darkblue,
                                      width: 2.0),
                                ),
                                backgroundColor: _selectedIndex == 0
                                    ? MaterialStateProperty.all<Color>(
                                        ConstantColor().darkblue)
                                    : MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor: _selectedIndex == 0
                                    ? MaterialStateProperty.all<Color>(
                                        Colors.white)
                                    : MaterialStateProperty.all<Color>(
                                        ConstantColor().darkblue),
                              ),
                              child: Text(
                                "All".tr,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _selectedIndex = 1;
                                });
                              },
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(0),
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      color: ConstantColor().darkblue,
                                      width: 2.0),
                                ),
                                backgroundColor: _selectedIndex == 1
                                    ? MaterialStateProperty.all<Color>(
                                        ConstantColor().darkblue)
                                    : MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor: _selectedIndex == 1
                                    ? MaterialStateProperty.all<Color>(
                                        Colors.white)
                                    : MaterialStateProperty.all<Color>(
                                        ConstantColor().darkblue),
                              ),
                              child: Text(
                                "General".tr,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _selectedIndex = 2;
                                });
                              },
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(0),
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      color: ConstantColor().darkblue,
                                      width: 2.0),
                                ),
                                backgroundColor: _selectedIndex == 2
                                    ? MaterialStateProperty.all<Color>(
                                        ConstantColor().darkblue)
                                    : MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor: _selectedIndex == 2
                                    ? MaterialStateProperty.all<Color>(
                                        Colors.white)
                                    : MaterialStateProperty.all<Color>(
                                        ConstantColor().darkblue),
                              ),
                              child: Text(
                                "Cardiologie".tr,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _selectedIndex = 3;
                                });
                              },
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(0),
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      color: ConstantColor().darkblue,
                                      width: 2.0),
                                ),
                                backgroundColor: _selectedIndex == 3
                                    ? MaterialStateProperty.all<Color>(
                                        ConstantColor().darkblue)
                                    : MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor: _selectedIndex == 3
                                    ? MaterialStateProperty.all<Color>(
                                        Colors.white)
                                    : MaterialStateProperty.all<Color>(
                                        ConstantColor().darkblue),
                              ),
                              child: Text(
                                "Dentiste".tr,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //matwakelch 5obz
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Text("${_doctor.doctors.length} ${"finding".tr}"),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 4, left: 8, right: 8, bottom: 0),
                    child: FutureBuilder<List<Doctor>>(
                        future: Future.value(_doctor.doctors), //fetchData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                itemCount: _doctor.doctors.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DoctorCardWidget(
                                        doctor: snapshot.data![index]),
                                  );
                                },
                              ),
                            );
                          } else {
                            return Container(
                              height: 500,
                              width: 500,
                              color: Colors.amber,
                            );
                          }
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inputFidlRecher() {
    return TextFormField(
        decoration:
            DecorationWidget(context, "${"Search".tr} ...", Icons.search));
  }

  InputDecoration DecorationWidget(BuildContext context, String text, icon) {
    return InputDecoration(
      fillColor: Colors.grey.withOpacity(.1),
      //filled: true,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12),
        child: Icon(
          icon,
          size: 20,
          color: ConstantColor().darkblue,
        ),
      ),
      label: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          text,
          style: TextStyle(color: ConstantColor().grey4),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: ConstantColor().darkblue),
        borderRadius: BorderRadius.circular(14),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ConstantColor().darkblue),
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }
}
