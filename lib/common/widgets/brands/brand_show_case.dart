import 'package:flutter/material.dart';
import 'package:mystore/common/widgets/brands/t_brand_cards.dart';

import '../../../features/shop/screens/store/Models/brandModel_mockdata.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/TRoundedContainer.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key, required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Troundedcontainer(
      showBorder: true,
      bordercolor: TColors.darkGrey,
      backgroundcolor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          TBrandCard(brand:demoBrands[0],showBorder: false,),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Row(
              children:
              images.map((image)=>brandProductImageWidget(image, context)).toList())
        ],
      ),
    );
  }

  Widget brandProductImageWidget(String image,context){
    return Expanded(
        child:Troundedcontainer(
          height: 100,
          backgroundcolor: THelperFunctions.isDarkMode(context)?TColors.darkGrey:TColors.light,
          margin: const EdgeInsets.only(right: TSizes.sm),
          padding: const EdgeInsets.all(TSizes.md),
          child: Image(fit:BoxFit.contain,image: AssetImage(image)),

        ) );
  }
}
