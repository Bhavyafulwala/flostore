import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mystore/data/repositories/user/user_repository.dart';
import 'package:mystore/features/authentication/models/user_model.dart';
import 'package:mystore/features/authentication/screens/signup/verify_email.dart';
import 'package:mystore/utils/helpers/network_manager.dart';
import 'package:mystore/utils/popups/loaders.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class SignupController extends GetxController{
  static SignupController get instance=>Get.find();

  final hidepassword=true.obs;
  final privacypolicy=true.obs;
  final email=TextEditingController();
  final lastname=TextEditingController();
  final username=TextEditingController();
  final phonenumber=TextEditingController();
  final password=TextEditingController();
  final firstname=TextEditingController();
  GlobalKey<FormState> signupFormkey=GlobalKey<FormState>();

  void signup() async {
    try {

      ///start loading

      ///check connectivity
      final isConnected=await NetworkManager.instance.isConnected();
      if(!isConnected){
        return;
      }
      ///Form validation
      if(!signupFormkey.currentState!.validate()){
        return;
      }
      ///check privacy policy
      if(!privacypolicy.value){
        TLoaders.warningSnackBar(title: "Accept Privacy Policy",message: "In order to create account you must accept our Privacy Policy and T.C");
        return;
      }
      TFullScreenLoader.openLoadingDialogue("We are processing your information...",TImages.docerAnimation );

      ///Register USer with Email and Password
      final userCredential=await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// Save Authenticated User data in Firebase firestore
      final newuser=UserModel(
          id: userCredential.user!.uid,
          username:username.text.trim() ,
          email: email.text.trim(),
          firstName: firstname.text.trim(),
          lastName: lastname.text.trim(),
          phoneNumber: phonenumber.text.trim(),
          profilePicture:''
      );
      final userRepository=Get.put(UserRepository());
      await userRepository.saveUserRecord(newuser);
      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: "Congratulations",message: "Your account has been created,Verify to continue");
      Get.to(()=>VerifyEmailScreen(email: email.text.trim(),));

  }

  catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap",message: e.toString());
  }

  }
  }


