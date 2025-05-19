import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final isdark = THelperFunctions.isDarkMode(context);
    return Troundedcontainer(
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundcolor: selectedAddress
          ? TColors.primary.withOpacity(0.6)
          : Colors.transparent,
      bordercolor: selectedAddress
          ? Colors.transparent
          : isdark
          ? TColors.darkGrey
          : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
                selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? isdark
                    ? TColors.light
                    : TColors.dark
                    : null
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Bhavya Fulwala",
                maxLines:1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: TSizes.sm/2,),
              Text("153 Maliwad,vyara ner post office,VYARA",maxLines: 1,softWrap: true,),
              const SizedBox(height: TSizes.sm/2,),
              Text("+91 7990653966",maxLines: 1,overflow: TextOverflow.ellipsis,)
            ],
          )
        ],
      ),
    );
  }
}
