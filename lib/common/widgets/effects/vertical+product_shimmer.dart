
import 'package:flutter/cupertino.dart';
import 'package:mystore/common/widgets/effects/t_shimmer_effect.dart';
import 'package:mystore/common/widgets/layouts/gridlayout.dart';
import 'package:mystore/utils/constants/sizes.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({this.itemCount=4, super.key});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridlayout(itemcount: itemCount, itembuilder:(_,__)=>const SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TShimmerEffect(width: 180, height: 180),
          SizedBox(height: TSizes.spaceBtwItems,),

          TShimmerEffect(width: 160, height: 15),
          SizedBox(height: TSizes.spaceBtwItems/2,),
          TShimmerEffect(width: 110, height: 15),

        ],
      ),
    ));
  }
}
