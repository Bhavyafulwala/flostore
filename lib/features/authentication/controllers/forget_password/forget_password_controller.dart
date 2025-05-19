import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mystore/data/repositories/authentication/authentication_repository.dart';
import 'package:mystore/features/authentication/screens/Password_configs/reset_password.dart';
import 'package:mystore/utils/helpers/network_manager.dart';
import 'package:mystore/utils/popups/full_screen_loader.dart';
import 'package:mystore/utils/popups/loaders.dart';

import '../../../../utils/constants/image_strings.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance=>Get.find();

  final email=TextEditingController();
  GlobalKey<FormState> forgetpasswordkey=GlobalKey<FormState>();

  sendPasswordResetEmail()async{
    try{
      TFullScreenLoader.openLoadingDialogue("Processing Your Request", TImages.docerAnimation);

      final isConnected=await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }
      if(!forgetpasswordkey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: "Email Sent",message: "Reset Password with Link Sent to Your Email.");

      Get.to(()=>ResetPassword(email: email.text.trim(),));
    }catch (e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap",message: e.toString());
    }

  }
  resendPAsswordResetEmail(String email)async{
    try{
      TFullScreenLoader.openLoadingDialogue("Processing Your Request", TImages.docerAnimation);

      final isConnected=await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: "Email Sent",message: "Reset Password with Link Sent to Your Email.");

    }catch (e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap",message: e.toString());
    }
  }
}