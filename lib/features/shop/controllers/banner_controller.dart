
import 'package:get/get.dart';
import 'package:mystore/data/repositories/banners/banner_repository.dart';
import 'package:mystore/features/shop/models/banner_model.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController{
  static BannerController get instance=>Get.find();

  final isLoading=false.obs;
  final carouselcurrentindex =0.obs;
  final RxList<BannerModel> banners=<BannerModel>[].obs;


  void updatepageindex(index) {
    carouselcurrentindex.value = index;
  }


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  Future<void> fetchBanners()async{
    try{
      isLoading.value=true;
      final bannerRepo=Get.put(BannerRepository());
      final banners=await bannerRepo.getBanners();

      this.banners.assignAll(banners);
      isLoading.value=false;
    }catch(e){
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
      isLoading.value=false;
      throw e;
    }finally{
      isLoading.value=false;

    }

  }


}