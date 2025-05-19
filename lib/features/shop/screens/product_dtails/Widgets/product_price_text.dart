import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    this.currencySign='\$',
    required this.price,
    this.maxLines=1,
    this.isLarge=false,
    this.islinethrough=false,
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool islinethrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price, maxLines: maxLines, overflow: TextOverflow.ellipsis,
      style:isLarge
          ?Theme.of(context).textTheme.headlineMedium
          :Theme.of(context).textTheme.titleLarge!.apply(decoration:isLarge?TextDecoration.lineThrough:null),
    );
  }
}
