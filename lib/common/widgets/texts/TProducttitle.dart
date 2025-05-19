import 'package:flutter/material.dart';

class Tproducttitletext extends StatelessWidget {
  const Tproducttitletext({
    super.key,
    required this.title,
    this.smallsize=true,
    this.maxlines=2,
    this.textAlign,
  });

  final String title;
  final bool smallsize;
  final int maxlines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallsize? Theme.of(context).textTheme.labelLarge:Theme.of(context).textTheme.titleSmall,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
