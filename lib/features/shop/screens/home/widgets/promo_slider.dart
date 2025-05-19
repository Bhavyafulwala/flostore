import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/widgets/effects/t_shimmer_effect.dart';
import 'package:mystore/features/shop/controllers/banner_controller.dart';
import 'package:mystore/features/shop/controllers/home_controllers.dart';
import 'package:mystore/utils/constants/colors.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/t_rounded_images.dart';
import '../../../../../utils/constants/sizes.dart';
class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(BannerController());
    return Obx(() {
      if(controller.isLoading.value)return TShimmerEffect(width: double.infinity, height: 190);
      if(controller.banners.isEmpty){
        return const Center(child: Text("No Data Found"));
      }else{
        return Column(
          children: [
            CarouselSlider(
              items: controller.banners.map((banners) => TRoundedImage(
                imageUrl: banners.imageUrl,
                isNetworkImage: true,
                onPressed: () => Get.toNamed(banners.targetScrren),))
                  .toList(),
              options: CarouselOptions(viewportFraction: 1,
                  onPageChanged: (index, _) => controller.updatepageindex(index)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Center(
              child: Obx(
                    () =>
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < controller.banners.length; i++)
                          TCircularContainer(
                            width: 20,
                            height: 4,
                            margin: const EdgeInsets.only(right: 10),
                            backgrcolor: controller.carouselcurrentindex.value ==
                                i ? TColors.primary : TColors.grey,
                          ),
                      ],
                    ),
              ),
            ),
          ],
        );

      }

    },

    );
  }
}
