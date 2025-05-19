
import 'package:flutter/cupertino.dart';
import 'package:mystore/common/widgets/effects/t_shimmer_effect.dart';
import 'package:mystore/common/widgets/layouts/gridlayout.dart';

class TBrandShimmer extends StatelessWidget {
  const TBrandShimmer({super.key, this.itemCount=4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridlayout(itemcount: itemCount, itembuilder:(_,__)=>const TShimmerEffect(width: 300, height: 80));
  }
}
