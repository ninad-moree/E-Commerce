import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../../authentication/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() async {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch the User Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final nameParts =
            UserModel.nameparts(userCredential.user!.displayName ?? '');
        final userName =
            UserModel.genrateUserName(userCredential.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          userName: userName,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        // Save User Data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      Loaders.warningSnackBar(
        title: 'Data Not Saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your profile',
      );
    }
  }
}
