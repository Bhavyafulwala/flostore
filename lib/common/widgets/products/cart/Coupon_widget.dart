import 'package:flutter/material.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/TRoundedContainer.dart';

class TCouponcode extends StatelessWidget {
  const TCouponcode({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final  isdark=THelperFunctions.isDarkMode(context);
    return Troundedcontainer(
      showBorder: true,
      backgroundcolor: isdark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
        top: TSizes.sm,
        bottom: TSizes.sm,
        right: TSizes.sm,
        left: TSizes.md,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Have a Promo Code? Enter here",
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          //button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: isdark?TColors.white.withOpacity(0.5):TColors.dark.withOpacity(0.5),
                  backgroundColor: TColors.grey.withOpacity(0.2),
                  side: BorderSide(color: Colors.grey.withOpacity(0.1))
              ),
              child: Text("Apply"),
            ),
          ),
        ],
      ),
    );
  }
}
