import 'package:flutter/material.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../features/shop/screens/product_dtails/Widgets/product_title_text.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../images/t_rounded_images.dart';
import '../../texts/tbrand_titletext_withverifyicon.dart';


class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final  isdark=THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        TRoundedImage(imageUrl: TImages.productImage1,
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          Backgroundcolor:isdark?TColors.darkGrey:TColors.light,),
        const SizedBox(width: TSizes.spaceBtwItems,),

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandtitltTextwithverifyicon(title: "Nike"),
              Flexible(child: TProductTitleText(title: "Blue Sports shoes",maxlines: 1,)),

              //Attributes
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: "Color: ",style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: "Green ",style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: "Size: ",style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: "UK 08 ",style: Theme.of(context).textTheme.bodyLarge),
                      ]
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}
