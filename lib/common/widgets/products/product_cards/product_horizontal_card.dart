import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/common/widgets/icons/TCircularIcon.dart';
import 'package:mystore/common/widgets/images/t_rounded_images.dart';
import 'package:mystore/common/widgets/texts/tbrand_titletext_withverifyicon.dart';
import 'package:mystore/features/shop/screens/product_dtails/Widgets/product_attribute.dart';
import 'package:mystore/features/shop/screens/product_dtails/Widgets/product_price_text.dart';
import 'package:mystore/features/shop/screens/product_dtails/Widgets/product_title_text.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/TRoundedContainer.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
        width: 310,
        padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
    borderRadius: BorderRadiusDirectional.circular(
    TSizes.productImageRadius,
    ),
    color: dark ? TColors.darkGrey : TColors.softGrey,
    ),
      child: Row(
        children: [
          Troundedcontainer(
            width: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundcolor: dark?TColors.dark:TColors.light,
            child: Stack(
              children: [
                SizedBox(
                  height:115,
                    width: 120,
                    child: TRoundedImage(padding:EdgeInsets.only(top: TSizes.md),imageUrl: TImages.productImage1,applyImageRadius: true,)),
                Positioned(
                  top: 6,
                  child: Troundedcontainer(
                    radius: TSizes.sm,
                    backgroundcolor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.xs),
                    child: Text("25%",style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                  ),
                ),
                const Positioned(
                  top: 0,
                    right: 0,
                    child:t_circular_icon(height:40,width:40,icon: Iconsax.heart5,color: Colors.red,) )

              ],
            ),
          ),
      Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: TSizes.sm,left: TSizes.sm),
                  child: Column(
                    children:[
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(title: "Green Nike shoes dfgdgdgdrgg",isSmall: true,),
                        const SizedBox(height: TSizes.spaceBtwItems/2,),
                        TBrandtitltTextwithverifyicon(title: "Nike")
                      ],
                    ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: TProductPriceText(price: "256")),
                    Container(
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
                      ),),
                    )
                        ],
                      )
                          ],
                    ),
                )
                ),
            ],
          )




    );
  }
}
