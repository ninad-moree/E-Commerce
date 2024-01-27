import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/user_model.dart';
import '../../screens/signup/verify_email.dart';
import '../../../../utils/helpers/network_manager.dart';

class SignupController extends GetxController {
  //dont need to create again and again
  static SignupController get instance => Get.find();

  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;

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
        FullScreenLoader.stopLoading();
        Loaders.errorSnackBar(
          title: 'No Connection',
          message:
              'Internet Connection is required to proceed further. Please check your connection and try again',
        );
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Not Checked
      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
          title: 'Accept Privacy Policies',
          message:
              'In order to create an account, you must accept our privacy policy and terms of use',
        );
        return;
      }

      // Register user in the firebase authentication and save user data in firebase
      final userCreds =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Save authenticated data in the firestore
      final newUser = UserModel(
        id: userCreds.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.tr,
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      FullScreenLoader.stopLoading();

      // Show success message
      Loaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created. Verify email to continure',
      );

      // Move to verify email screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      FullScreenLoader.stopLoading();

      Loaders.errorSnackBar(title: 'Oh Snap!!', message: e.toString());
    }
  }
}
