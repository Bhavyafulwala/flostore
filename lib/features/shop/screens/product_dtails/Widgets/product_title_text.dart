import 'package:flutter/material.dart';

class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key,
    required this.title,
    this.isSmall= false,
    this.maxlines=1,
    this.textalign=TextAlign.left,
  });

  final String title;
  final bool isSmall;
  final int maxlines;
  final TextAlign? textalign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          isSmall
              ? Theme.of(context).textTheme.labelLarge
              : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxlines,
      textAlign: textalign,
    );
  }
}
