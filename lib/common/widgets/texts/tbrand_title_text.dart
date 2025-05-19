import 'package:flutter/material.dart';
import 'package:mystore/utils/constants/enums.dart';

import '../../../utils/constants/colors.dart';

class TBrandtitltText extends StatelessWidget {
  const TBrandtitltText({
    super.key,
    required this.title,
    this.maxlines=1,
    this.color=TColors.primary,
    this.textalign=TextAlign.center,
    this.brandtextsize=TextSizes.small,
  });

  final String title;
  final int maxlines;
  final Color? color;
  final TextAlign? textalign;
  final TextSizes brandtextsize;

  @override
  Widget build(BuildContext context) {
    return Text(
          title,
          textAlign: textalign,
          overflow: TextOverflow.ellipsis,
          maxLines: maxlines,
          style: brandtextsize==TextSizes.small
              ?Theme.of(context).textTheme.labelMedium!.apply(color: color)
              :brandtextsize==TextSizes.medium
              ?Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              :brandtextsize==TextSizes.large
              ?Theme.of(context).textTheme.titleLarge!.apply(color: color)
              :Theme.of(context).textTheme.bodyMedium!.apply(color: color),
        );
  }
}
