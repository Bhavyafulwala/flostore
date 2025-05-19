import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mystore/common/widgets/custom_shapes/containers/primary_HEADER_CONTAINER.dart';
import 'package:mystore/features/shop/controllers/Products/product_controller.dart';
import 'package:mystore/features/shop/models/ProductModel.dart';
import 'package:mystore/features/shop/screens/all_products.dart';
import 'package:mystore/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:mystore/features/shop/screens/home/widgets/home_categories.dart';
import 'package:mystore/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/effects/vertical+product_shimmer.dart';
import '../../../../common/widgets/layouts/gridlayout.dart';
import '../../../../common/widgets/products/product_cards/product_vertical_card.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const THomeAppbar(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSearchContainer(text: "Search in Store"),
                  Padding(
                    padding: EdgeInsets.all(TSizes.defaultSpace),
                    child: Column(
                      children: [
                        const TsectionHeadingBut(
                          title: "Popular Items",
                          showActionButton: false,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        home_categories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TsectionHeadingBut(
                    title: 'Popular Products',
                    onpressed: () => Get.to(() => AllProducts(title: "Popular Products",
                    //if you write quer too then compiler will first priotize futureMethod
                    futureMethod: controller.fetchAllFeaturedProducts(),)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Obx(() {
                    if (controller.isLoading.value)
                      return const TVerticalProductShimmer();
                    if (controller.featuredProducts.isEmpty) {
                      return const Center(child: Text("No Data Found!"));
                    }

                    return TGridlayout(
                      itemcount: controller.featuredProducts.length,
                      mainAxisExtent: 285,
                      itembuilder: (_, index) => TProductCartVertical(product:controller.featuredProducts[index]),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
