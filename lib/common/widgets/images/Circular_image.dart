import 'package:flutter/material.dart';
import 'package:mystore/common/widgets/effects/t_shimmer_effect.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TCircularimage extends StatelessWidget {
  const TCircularimage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = 0,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlaycolor,
    this.backgroundcolor,
  });

  final double width, height, padding;
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlaycolor;
  final Color? backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color:
            THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child:
              isNetworkImage
                  ? Image.network(
                    fit: fit,
                    image,
                    color: overlaycolor,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              )
                  :Image.asset(
                image,
                fit: fit,
                color: overlaycolor,
              ),
        ),
      ),
    );
  }
}
