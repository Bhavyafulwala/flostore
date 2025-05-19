import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/TCircularIcon.dart';

class TProductQuantitywithAddandRemove extends StatelessWidget {
  const TProductQuantitywithAddandRemove({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final isdark=THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:[
        t_circular_icon(
          icon:Iconsax.minus,
          height: 32,
          width: 32,
          size: TSizes.md,
          color: isdark?TColors.white:TColors.black,
          backgroundcolor: isdark?TColors.darkGrey:TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Text("2",style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSizes.spaceBtwItems,),
        t_circular_icon(
          icon:Iconsax.add,
          height: 32,
          width: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundcolor: TColors.primary,
        ),
      ],);
  }
}

