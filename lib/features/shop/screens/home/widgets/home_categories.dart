import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/widgets/effects/category_shimmer_effect.dart';
import 'package:mystore/features/shop/controllers/category_controller.dart';
import 'package:mystore/features/shop/screens/sub_categories/sub_categories.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class home_categories extends StatelessWidget {
  const home_categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController=Get.put(CategoryController());
    return Obx((){
      if(categoryController.isLoading.value)return const TCategoryShimmer();
      if(categoryController.featuredCategories.isEmpty){
        return Text("No Data Found!!!",style:Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),);
      }
      return SizedBox(
        height: 81,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category=categoryController.featuredCategories[index];
            return TVerticalImageText(image:category.image,title: category.name,OnTap:()=>Get.to(()=>SubCategoriesScreen()),);
          },
        ),
      );
    }

    );
  }
}

