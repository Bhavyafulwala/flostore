import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mystore/data/repositories/authentication/authentication_repository.dart';
import 'package:mystore/data/repositories/user/user_repository.dart';
import 'package:mystore/features/authentication/screens/login/login.dart';
import 'package:mystore/features/personalisation/screens/profile/widgets/reauthenticate_user_login_form.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/network_manager.dart';
import 'package:mystore/utils/popups/full_screen_loader.dart';
import 'package:mystore/utils/popups/loaders.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/format_exception.dart';
import '../../authentication/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();


  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel
      .empty()
      .obs;

  final hidePassword = false.obs;
  final imageuploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reauthenticateFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

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

  //Save user credential from any Registration Provider

  Future<void> saveUserRecord(UserCredential? usercredential) async {
    try {
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (usercredential != null) {
          final nameParts = UserModel.nameParts(
              usercredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              usercredential.user!.displayName ?? '');

          //Map data
          final user = UserModel(id: usercredential.user!.uid,
              username: username,
              email: usercredential.user!.email ?? '',
              firstName: nameParts[0],
              lastName: nameParts.length > 1
                  ? nameParts.sublist(1).join(' ')
                  : '',
              phoneNumber: usercredential.user!.phoneNumber ?? '',
              profilePicture: usercredential.user!.photoURL ?? '');

          //save data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(title: "Data not saved",
          message: "Something went wrong,You can re-save your data in profile");
    }
  }

  void deleteAccountWarningPoppup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: "Delete Account",
        middleText: "Are you sure you want to delete your account permanently?Your all data will be removed!",
        confirm: ElevatedButton(onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: const Text("Delete"),)),
        cancel: OutlinedButton(onPressed: Navigator
            .of(Get.overlayContext!)
            .pop, child: const Text("Cancel"))
    );
  }

  Future<void> deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialogue(
          "Removing Account", TImages.docerAnimation);

      ///First Reaunthenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!
          .providerData
          .map((e) => e.providerId)
          .first;
      if (provider.isNotEmpty) {
        if (provider == "google.com") {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        } else if (provider == "password") {
          TFullScreenLoader.stopLoading();
          Get.to(ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  /// ReAuthenticate User before deleting
  Future<void> reAuthenticateEmailandPassworduser() async {
    try {
      TFullScreenLoader.openLoadingDialogue(
          "Processing", TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!reauthenticateFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailandPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,
          imageQuality: 65,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageuploading.value = true;
        final imageUrl = await userRepository.uploadImage(
            "Users/Images/Profile", image);

        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(
            title: "Congrats", message: "Image changed Successfully");
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Something went wrong.:$e");
    } finally {
      imageuploading.value = false;
    }
  }
}