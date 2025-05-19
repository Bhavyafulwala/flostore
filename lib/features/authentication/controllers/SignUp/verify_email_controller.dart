import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mystore/data/repositories/authentication/authentication_repository.dart';
import 'package:mystore/features/authentication/controllers/SignUp/Success_screen.dart';
import 'package:mystore/utils/constants/text_strings.dart';
import 'package:mystore/utils/popups/loaders.dart';

import '../../../../utils/constants/image_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instancs => Get.find();


  //send email whenever verify screen appears and set autotimer
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();

    super.onInit();
  }

  //Send Email verification Loink
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: "Email Sent",
          message: "Please Check Your Inbox and Verify Email.");
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(SuccessScreen(image: TImages.RegistSuccess,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onpressed: ()=>AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }
  //Manually checking verificstion
  checkEmailVerification(){
    final currentuser=FirebaseAuth.instance.currentUser;
    if(currentuser!=null&&currentuser.emailVerified ){
      Get.off(SuccessScreen(image: TImages.staticSuccessIllustration,
          title: TTexts.yourAccountCreatedTitle,
          subtitle: TTexts.yourAccountCreatedSubTitle,
          onpressed: ()=>AuthenticationRepository.instance.screenRedirect()));
    }

    }

  }
