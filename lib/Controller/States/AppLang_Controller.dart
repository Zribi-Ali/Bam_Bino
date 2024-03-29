import 'package:bambino/Setting/LocalStorage/LocalStorage_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLang extends GetxController {
  var appLocalLang = 'fr';
  @override
  void onInit() async {
    super.onInit();
    LocalStorage localStorage = LocalStorage();

    appLocalLang = await localStorage.getLanguageSelected;

    Get.updateLocale(Locale(appLocalLang));
    update();
  }

  void changeLanguage(String type) {
    LocalStorage localStorage = LocalStorage();
    if (localStorage == type) {
      return;
    } else if (type == 'ar') {
      appLocalLang = 'ar';
      localStorage.saveLonguage('ar');
    } else if (type == 'fr') {
      appLocalLang = 'fr';
      localStorage.saveLonguage('fr');
    }
    update();
  }

  String getLang() {
    return appLocalLang;
  }
}
