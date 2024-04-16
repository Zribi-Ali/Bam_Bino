import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Setting/Colors/colorsSetting.dart';
import '../../Widget/CardHomeDoctor_Widget.dart';

class Fondateur extends StatelessWidget {
  const Fondateur({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return SizedBox(
      height: Get.height * 0.55,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: Container(
              height: Get.height * 0.5,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/Fondateur.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: Get.width * 0.001,
            child: Transform.rotate(
              angle: 0.02,
              child: buildCardText(controller),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildCardText(controller) {
  return SizedBox(
    height: Get.width * 0.34,
    child: Stack(
      children: [
        PageView(
          controller: controller,
          onPageChanged: (indexPage) {},
          children: [
            cardHomeDoctorTextWidget("Fondateur1".tr),
            cardHomeDoctorTextWidget("Fondateur2".tr),
            cardHomeDoctorTextWidget("Fondateur3".tr),
            cardHomeDoctorTextWidget("Fondateur4".tr),
            cardHomeDoctorTextWidget("Fondateur5".tr),
            cardHomeDoctorTextWidget("Fondateur6".tr),
            cardHomeDoctorTextWidget("Fondateur7".tr),
            cardHomeDoctorTextWidget("Fondateur8".tr),
            cardHomeDoctorTextWidget("Fondateur9".tr),
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.9),
          child: SmoothPageIndicator(
            controller: controller,
            count: 9,
            effect: ExpandingDotsEffect(
              dotColor: ConstantColor().blue.withOpacity(.5),
              activeDotColor: ConstantColor().blue,
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),
        ),
      ],
    ),
  );
}

 /*
child: Stack(
            children: [
              PageView(
                controller: controller,
                onPageChanged: (indexPage) {},
                children: [
                  cardHomeDoctorTextWidget("Fondateur1".tr),
                  cardHomeDoctorTextWidget("Fondateur2".tr),
                  cardHomeDoctorTextWidget("Fondateur3".tr),
                  cardHomeDoctorTextWidget("Fondateur4".tr),
                  cardHomeDoctorTextWidget("Fondateur5".tr),
                  cardHomeDoctorTextWidget("Fondateur6".tr),
                  cardHomeDoctorTextWidget("Fondateur7".tr),
                  cardHomeDoctorTextWidget("Fondateur8".tr),
                  cardHomeDoctorTextWidget("Fondateur9".tr),
                ],
              ),
              Container(
                alignment: const Alignment(0, 0.9),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 9,
                  effect: ExpandingDotsEffect(
                    dotColor: ConstantColor().grey1,
                    activeDotColor: ConstantColor().grey2,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
              ),
            ],
          ),

          **************
          Container(
                alignment: const Alignment(0, .95),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 9,
                  effect: ExpandingDotsEffect(
                    dotColor: ConstantColor().grey1,
                    activeDotColor: ConstantColor().grey2,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
              ),
          
   */
