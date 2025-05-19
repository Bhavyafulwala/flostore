import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../models/ProductModel.dart';

class ImagesController extends GetxController{
  static ImagesController get instance=>Get.find();

  RxString selectedProductImage =''.obs;

  List<String> getAllProductImages(ProductModel product){

    //set bcs we dont want duplicate images
    Set<String> images={};

    images.add(product.thumbnail);

    selectedProductImage.value=product.thumbnail;

    if(product.images!=null){
      images.addAll(product.images!);
    }

    if(product.productVariations!=null||product.productVariations!.isNotEmpty){
      images.addAll(product.productVariations!.map((variation)=>variation.image));
    }
    return images.toList();

  }
  void showEnlargedImage(String image){
    Get.to(fullscreenDialog: true,
        ()=>Dialog.fullscreen(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding:const EdgeInsets.symmetric(vertical: TSizes.defaultSpace*2,horizontal: TSizes.defaultSpace) ,
              child:Image(image:NetworkImage(image),),),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Align(
                alignment: Alignment.bottomCenter,
                child: OutlinedButton(onPressed: ()=>Get.back(), child: const Text('Close'),),
              )
            ],
          ),
        )
    );
  }
}