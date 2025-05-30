
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mystore/data/repositories/product/product_repository.dart';
import 'package:mystore/utils/popups/loaders.dart';

import '../../models/ProductModel.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString SelectedSortOption='Name'.obs;
  final RxList<ProductModel> products=<ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? qurery) async {
    try {
      if (qurery == null) return [];
      final products = await repository.fetchProductsByQuery(qurery);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption){
    SelectedSortOption.value=sortOption;

    switch(sortOption){
      case 'Name':
        products.sort((a,b)=>a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        products.sort((a,b)=>b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        products.sort((a,b)=>a.price.compareTo(b.price));
        break;
      case 'Newest':
        products.sort((a,b)=>b.date!.compareTo(a.date!));
        break;
      case 'Sale':
        products.sort((a,b){
          if(b.salePrice>0){
            return b.salePrice.compareTo(a.salePrice);
          }else if(a.salePrice>0){
            return -1;
          }else{
            return -1;
          }
        });
        break;
        default:
          products.sort((a,b)=>a.title.compareTo(b.title));
    }

  }
  void assignProducts(List<ProductModel> products){
    this.products.assignAll(products);
    sortProducts('Name');
  }
}