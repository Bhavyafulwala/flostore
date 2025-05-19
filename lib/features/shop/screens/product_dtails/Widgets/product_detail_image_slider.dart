import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/features/shop/models/ProductModel.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/appBar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_widgets/curved_edges_widgets.dart';
import '../../../../../common/widgets/icons/TCircularIcon.dart';
import '../../../../../common/widgets/images/t_rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/Products/images_controller.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key, required this.product,
  });
  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ImagesController());
    final images=controller.getAllProductImages(product);
    final isdark=THelperFunctions.isDarkMode(context);
    return TCustomCurveWidget(
      child: Container(
        color: isdark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 380,
              child: Padding(
                padding: const EdgeInsets.all(
                  TSizes.productImageRadius * 2 + 4,
                ),
                child: Center(
                  child: Obx((){
                    final image=controller.selectedProductImage.value;
                    if(image.isEmpty){
                      return CircularProgressIndicator(color: TColors.primary,);
                    }
                    return GestureDetector(
                      onTap: ()=>controller.showEnlargedImage(image),
                        child: Image(image: NetworkImage(image,)));
                  }
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 26,
              left: TSizes.defaultSpace-5,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount:images.length,
                  shrinkWrap: true,
                  scrollDirection:Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_,__)=>(const SizedBox(width: TSizes.spaceBtwItems-2,)),
                  itemBuilder: (_,index)=>Obx(
                      (){
                        final selectedimage=controller.selectedProductImage.value==images[index];
                        return TRoundedImage(
                          imageUrl: images[index],
                          isNetworkImage: true,
                          onPressed:()=>controller.selectedProductImage.value=images[index] ,
                          width: 80,
                          Border: Border.all(color:selectedimage? TColors.primary:Colors.transparent),
                          padding: const EdgeInsets.all(TSizes.sm),
                        );
                      }
                  )
                ),
              ),
            ),

            TAppbar(showbackarrow: true,actions: [
              t_circular_icon(icon: Iconsax.heart5,color: Colors.red,)
            ],)
          ],
        ),
      ),
    );
  }
}
