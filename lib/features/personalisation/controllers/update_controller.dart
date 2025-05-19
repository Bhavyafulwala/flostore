
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mystore/data/repositories/user/user_repository.dart';
import 'package:mystore/features/personalisation/controllers/user_controller.dart';
import 'package:mystore/features/personalisation/screens/profile/profile.dart';
import 'package:mystore/utils/helpers/network_manager.dart';
import 'package:mystore/utils/popups/full_screen_loader.dart';
import 'package:mystore/utils/popups/loaders.dart';

import '../../../utils/constants/image_strings.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance=>Get.find();

  final firstName=TextEditingController();
  final lastName=TextEditingController();
  final userController=UserController.instance;
  final userRepository=UserRepository.instance;
  GlobalKey<FormState> updateUserNameFormKey=GlobalKey<FormState>();

  @override
  void onInit() {
    initialiseNames();
    super.onInit();
  }
  ///Fetch User Record
  Future<void> initialiseNames()async{
    firstName.text=userController.user.value.firstName;
    lastName.text=userController.user.value.lastName;
  }
  Future<void> updateUserName()async{
    try{
      TFullScreenLoader.openLoadingDialogue("Updating Information", TImages.docerAnimation);
      final isConnected=await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      if(!updateUserNameFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String,dynamic> name={'FirstName':firstName.text.trim(),'LastName':lastName.text.trim()};
      await UserRepository.instance.updateSingleField(name);


      userController.user.value.firstName=firstName.text.trim();
      userController.user.value.lastName=lastName.text.trim();

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title:"Done",message: "Your Data is Successfully Updated.");

      //try rempove this under supervision
      Get.off(()=>const ProfileScreen());
    }catch (e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap",message: e.toString());
    }
  }
}