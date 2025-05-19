import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/common/widgets/texts/tbrand_title_text.dart';
import 'package:mystore/utils/constants/enums.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TBrandtitltTextwithverifyicon extends StatelessWidget {
  const TBrandtitltTextwithverifyicon({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.textcolor,
    this.iconcolor = TColors.primary,
    this.textalign = TextAlign.center,
    this.brandtextsize = TextSizes.small,
  });

  final String title;
  final int maxlines;
  final Color? textcolor, iconcolor;
  final TextAlign? textalign;
  final TextSizes brandtextsize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandtitltText(
            title: title,
            color: textcolor,
            maxlines: maxlines,
            textalign: textalign,
            brandtextsize: brandtextsize,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        const Icon(
          Iconsax.verify5,
          color: TColors.primary,
          size: TSizes.iconXs,
        ),
      ],
    );
  }
}
