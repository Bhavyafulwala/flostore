

import 'package:get/get.dart';
import 'package:mystore/utils/popups/loaders.dart';

import '../../../data/repositories/categories/categories_repositories.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController{
  static CategoryController get instance=>Get.find();

  final isLoading=false.obs;
  final _categoryRepository=Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories=<CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories=<CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories()async{
    try{
        isLoading.value=true;
        final categories=await _categoryRepository.getAllCategories();
        allCategories.assignAll(categories);
        
        featuredCategories.assignAll(allCategories.where((categories)=>categories.isFeatured && categories.parentId.isEmpty).take(8).toList());
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