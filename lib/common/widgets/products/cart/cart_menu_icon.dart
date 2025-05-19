import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/features/shop/screens/cart/cart.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
class TCartCounterItems extends StatelessWidget {
  const TCartCounterItems({
    super.key,this.Iconcolor=TColors.white, required this.onPressed,
  });

  final Color Iconcolor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isdark=THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed:()=>Get.to(()=>CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: isdark?TColors.white:TColors.dark,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: TColors.black,
            ),
            child: Center(
              child: Text("2",style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white,fontSizeFactor: 0.85),),
            ),
          ),
        ),
      ],
    );
  }
}
