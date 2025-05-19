import 'package:flutter/material.dart';
import 'package:mystore/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:mystore/common/widgets/texts/section_heading.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark=THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TsectionHeadingBut(title: "Payment method",buttontilte: "Change",onpressed: (){},),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children:[
            Troundedcontainer(
            width: 60,
            height: 35,
            backgroundcolor: isdark?TColors.light:TColors.white,
            padding: const EdgeInsets.all(TSizes.sm),
            child: const Image(image: AssetImage(TImages.paypal),fit: BoxFit.contain,),
          ),
        const SizedBox(width: TSizes.spaceBtwItems/2,),
        Text("Paypal",style: Theme.of(context).textTheme.bodyLarge,),
    ],),

      ],
    );
  }
}
