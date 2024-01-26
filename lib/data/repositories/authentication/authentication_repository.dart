import 'dart:developer';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  // called from main.dart on app launch
  @override
  void onReady() async {
    FlutterNativeSplash.remove();
    await screenRedirect();
  }

  // function to share relevant screen
  screenRedirect() async {
    log('Get Storage');
    log(deviceStorage.read('IsFirstTime').toString());

    // local storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }
}
