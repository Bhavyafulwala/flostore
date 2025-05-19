import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mystore/data/repositories/authentication/authentication_repository.dart';
import 'package:mystore/utils/helpers/network_manager.dart';
import 'package:mystore/utils/popups/full_screen_loader.dart';
import 'package:mystore/utils/popups/loaders.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../personalisation/controllers/user_controller.dart';

class LoginController extends GetxController {


  final email = TextEditingController();
  final password = TextEditingController();
  final localStorage = GetStorage();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final usercontroller=Get.put(UserController());



  @override
  void onInit() {
    email.text=localStorage.read('REMEMBER_ME_EMAIL')??'';
    password.text=localStorage.read('REMEMBER_ME_PASSWORD')??'';
    super.onInit();
  }

  Future<void> emailAndPAsswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialogue(
          "Logging You In...", TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    }catch (e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }

  Future<void> googleSignIn()async {
    try {
      TFullScreenLoader.openLoadingDialogue(
          "Logging You In...", TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Google Auth
      final userCredentials = await AuthenticationRepository()
          .signInWithGoogle();

      //Save data
      await usercontroller.saveUserRecord(userCredentials);
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    }catch (e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }

}