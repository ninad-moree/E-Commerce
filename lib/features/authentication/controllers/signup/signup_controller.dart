import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import 'network_manager.dart';

class SignupController extends GetxController {
  //dont need to create again and again
  static SignupController get instance => Get.find();

  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  // form key for validation
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // SIGNUP FUNCTION
  Future<void> signup() async {
    try {
      // Start the loading
      FullScreenLoader.openLoadingDialog(
        'We are processing your information',
        TImages.docerAnimation,
      );

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        Loaders.errorSnackBar(
          title: 'No Connection',
          message:
              'Internet Connection is required to proceed further. Please check your connection and try again',
        );
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        return;
      }
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    } finally {
      FullScreenLoader.stopLoading();
    }
  }
}
