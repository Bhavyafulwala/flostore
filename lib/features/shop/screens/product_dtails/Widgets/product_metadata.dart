import 'package:flutter/material.dart';
import 'package:mystore/common/widgets/images/Circular_image.dart';
import 'package:mystore/common/widgets/texts/tbrand_titletext_withverifyicon.dart';
import 'package:mystore/features/shop/controllers/Products/product_controller.dart';
import 'package:mystore/features/shop/models/ProductModel.dart';
import 'package:mystore/features/shop/screens/product_dtails/Widgets/product_price_text.dart';
import 'package:mystore/features/shop/screens/product_dtails/Widgets/product_title_text.dart';
import 'package:mystore/utils/constants/enums.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller=ProductController.instance;
    final salePercentage=controller.calculateSalePercentage(product.price, product.salePrice);
    final isdark=THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Row(
    children: [
    Troundedcontainer(
    radius: TSizes.sm,
      backgroundcolor: TColors.secondary.withOpacity(0.9),
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.sm,
        vertical: TSizes.xs,
      ),
      child: Text(
        '$salePercentage%',
        style: Theme
            .of(
          context,
        )
            .textTheme
            .labelLarge!
            .apply(color: TColors.black),
      ),
    ),
    const SizedBox(width: TSizes.spaceBtwItems,),
      if (product.productType == 'single' && product.salePrice > 0) ...[
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.titleSmall!.apply(
            decoration: TextDecoration.lineThrough,
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        TProductPriceText(
          price: controller.getProductPrice(product),
          isLarge: true,
        ),
      ] else ...[
        TProductPriceText(
          price: controller.getProductPrice(product),
          isLarge: true,
        ),
      ]


    ],
    ),
    const SizedBox(height: TSizes.spaceBtwItems/1.5,),
    TProductTitleText(title: product.title),
    const SizedBox(height: TSizes.spaceBtwItems/1.5,),

    Row(
    children: [
    TProductTitleText(title: "Status"),
    const SizedBox(width: TSizes.spaceBtwItems,),
    Text(controller.getProductStockStatus(product.stock),style:Theme.of(context).textTheme.titleMedium)
    ],
    ),
    const SizedBox(height: TSizes.spaceBtwItems/2.5,),
    Row(children:[
      TCircularimage(image:product.brand!=null?product.brand!.image:'',
      width: 32,
      height: 32,
      overlaycolor: isdark?TColors.white:TColors.black,),
      const SizedBox(width: TSizes.spaceBtwItems/1.5,),

      TBrandtitltTextwithverifyicon(title:product.brand!=null?product.brand!.name:'',brandtextsize: TextSizes.medium,)])

    ]
    ,
    );
  }
}
