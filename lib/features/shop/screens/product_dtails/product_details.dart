import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/common/widgets/texts/section_heading.dart';
import 'package:mystore/features/shop/screens/product_dtails/Widgets/bottom_add_to_cart.dart';
import 'package:mystore/features/shop/screens/product_dtails/Widgets/product_attribute.dart';
import 'package:mystore/features/shop/screens/product_dtails/Widgets/product_metadata.dart';
import 'package:mystore/features/shop/screens/products_reviews/product_reviews.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/ProductModel.dart';
import 'Widgets/product_detail_image_slider.dart';
import 'Widgets/rating_nd_sharing.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isdark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TProductImageSlider(product: product),
            Padding(
              padding: const EdgeInsets.only(
                left: TSizes.defaultSpace,
                right: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  TRatingandShare(),
                  TProductMetaData(product: product),
                  SizedBox(height: TSizes.spaceBtwItems/2.5,),
                  TProductAttributes(product: product),
                  SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Checkout"),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TsectionHeadingBut(
                    title: "Description",
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description??'',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  colorClickableText: TColors.primary,),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    const TsectionHeadingBut(title: "Reviews(199)",showActionButton: false,),
                    IconButton(onPressed: ()=>Get.to(()=>TProductReviewsScreen()), icon: Icon(Iconsax.arrow_right_3))
                    
                  ]),
                  const SizedBox(height: TSizes.spaceBtwSections,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
