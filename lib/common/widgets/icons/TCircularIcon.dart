import 'package:flutter/material.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class t_circular_icon extends StatelessWidget {
  const t_circular_icon({
    super.key,
    this.width, this.height, this.size=TSizes.lg, required this.icon, this.color, this.backgroundcolor, this.onpressed,
  });


  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundcolor;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Container(
      width:width,
      height:height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundcolor!=null
                 ?backgroundcolor!
                 :dark ? TColors.black.withOpacity(0.9) : TColors.white
              .withOpacity(0.9)
      ),
      child: IconButton(onPressed: () {}, icon: Icon(icon,color: color,size: size,)),
    );
  }
}
