import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../Controller/States/User_Controller.dart';
import '../../../Setting/Colors/colorsSetting.dart';

import '../../Widget/InputFilde_Widget.dart';
import 'Forget_CodeVerify_Screen.dart';

class ForgetPassworEmail extends StatefulWidget {
  const ForgetPassworEmail({super.key});

  @override
  State<ForgetPassworEmail> createState() => _ForgetPassworEmailState();
}

class _ForgetPassworEmailState extends State<ForgetPassworEmail> {
  @override
  Widget build(BuildContext context) {
    UserController userController = UserController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Image.asset("assets/logo.png"),
              Text(
                "motpass".tr,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "motPassEmail".tr,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: ConstantColor().grey4),
              ),
              const SizedBox(
                height: 45,
              ),
              textFormFieldWidget(
                  context,
                  userController.emailController,
                  TextInputType.emailAddress,
                  "email".tr,
                  FontAwesomeIcons.envelope,
                  userController.emailU,
                  userController),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ConstantColor().blue,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 10,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'CormorantGaramond',
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CodeVerificationPassword()));
                    },
                    child: FittedBox(
                      child: Text(
                        "SendCode".tr,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}