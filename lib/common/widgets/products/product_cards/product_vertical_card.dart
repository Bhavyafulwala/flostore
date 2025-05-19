import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/common/styles/shadows.dart';
import 'package:mystore/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:mystore/common/widgets/images/t_rounded_images.dart';
import 'package:mystore/features/shop/controllers/Products/product_controller.dart';
import 'package:mystore/features/shop/models/ProductModel.dart';
import 'package:mystore/features/shop/screens/product_dtails/product_details.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/enums.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/TCircularIcon.dart';
import '../../prices/product_price.dart';
import '../../texts/TProducttitle.dart';
import '../../texts/tbrand_titletext_withverifyicon.dart';

class TProductCartVertical extends StatelessWidget {
  const TProductCartVertical({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller=ProductController.instance;
    final salePercentage=controller.calculateSalePercentage(product.price, product.salePrice);
    final dark=THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ()=>Get.to(()=>ProductDetailScreen(product: product,)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          boxShadow: [TShadow.verticalProductShadow],
          borderRadius: BorderRadiusDirectional.circular(
            TSizes.productImageRadius,
          ),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            Troundedcontainer(
              height: 180,
              padding: EdgeInsets.all(TSizes.md - 4),
              backgroundcolor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  Center(
                    child: TRoundedImage(
                      imageUrl: product.thumbnail,
                      Backgroundcolor: dark ? TColors.dark : TColors.light,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
                  ),
                  Positioned(
                    top: 6,
                    child: Troundedcontainer(
                      radius: TSizes.sm,
                      backgroundcolor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm,
                        vertical: TSizes.xs,
                      ),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: TColors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -0.7,
                    right: -0.5,
                    child: t_circular_icon(
                      width: 38,
                      height: 38,
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2.5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Tproducttitletext(title: product.title),
                const SizedBox(height: TSizes.spaceBtwItems / 2.5),
                TBrandtitltTextwithverifyicon(title:product.brand!.name,),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children:[
                      if(product.productType=='single'&&product.salePrice>0)
                        Padding(
                          padding: EdgeInsets.only(left: TSizes.sm),
                          child: Text(product.price.toString(),style: Theme.of(context).textTheme.labelMedium!.apply(decoration:TextDecoration.lineThrough),)
                        ),
                      Padding(
                      padding: EdgeInsets.only(left: TSizes.sm),
                      child: Tproductprice(price:controller.getProductPrice(product), isLarge: false),
                    ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: TSizes.sm - 4.5,
                    right: TSizes.sm - 4.5,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight: Radius.circular(TSizes.cardRadiusMd),
                      ),
                    ),
                    child: const SizedBox(
                      height: TSizes.iconLg * 1.2,
                      width: TSizes.iconLg * 1.2,
                      child: Center(
                        child: Icon(Iconsax.add, color: TColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

