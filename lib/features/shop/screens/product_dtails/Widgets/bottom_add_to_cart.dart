import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/common/widgets/icons/TCircularIcon.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark=THelperFunctions.isDarkMode(context);
    return Container(
      margin: const EdgeInsets.only(bottom:TSizes.spaceBtwItems-14),
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace,vertical: TSizes.defaultSpace/2),
      decoration: BoxDecoration(
        color: isdark?TColors.darkGrey:TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children:[
              t_circular_icon(icon: Iconsax.minus,
            backgroundcolor: TColors.darkGrey,
            height: 40,
            width: 40,
            color: TColors.white,),
          const SizedBox(width: TSizes.spaceBtwItems,),
          Text('2',style: Theme.of(context).textTheme.titleSmall,),
          const SizedBox(width: TSizes.spaceBtwItems,),
          t_circular_icon(icon: Iconsax.add,
            backgroundcolor: TColors.black,
            height: 40,
            width: 40,
            color: TColors.white,),
    ],
    ),
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: TColors.black,
                side: const BorderSide(color:TColors.black)
              ),
              child: const Text("Add to Cart"))
        ],
      ),
    );
  }
}
