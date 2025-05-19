
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mystore/features/authentication/screens/login/login.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance=>Get.find();

  //variables
  final pagecongtroller=PageController();
  Rx<int> currentPageIndex=0.obs;

// update current index when scroll
  void UpdatePageIndicator(index)=>currentPageIndex.value=index;
//jump to specific dot selected page
  void NavigationClick(index){
    currentPageIndex.value=index;
    pagecongtroller.jumpTo(index);
  }
//update current page and jump to next page
  void nextPage(){
    if(currentPageIndex==2){
      final storage=GetStorage();
      storage.write("IsFirstTime", false);
      Get.offAll(LoginScreen());
    }
    else{
      int page=currentPageIndex.value+1;
      pagecongtroller.jumpToPage(page);
    }

  }
  //update current page and jump to last page
  void skipPage(){
    currentPageIndex.value=2;
    pagecongtroller.jumpToPage(2);

  }

}