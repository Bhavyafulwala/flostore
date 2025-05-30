import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mystore/common/widgets/loaders/animation_loader.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

class TFullScreenLoader {
  static void openLoadingDialogue(String text, String animation) {
    showDialog(context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_)=>PopScope(
          canPop:false ,
          child: Container(
            color: THelperFunctions.isDarkMode(Get.context!)?TColors.dark:TColors.white,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 250,),
                TAnimationLoaderWidget(text: text, animation: animation,)
              ],
            ),

          ),
        )
    );
  }
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}
