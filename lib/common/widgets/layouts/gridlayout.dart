import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class TGridlayout extends StatelessWidget {
  const TGridlayout({
    super.key,
    required this.itemcount,
    this.mainAxisExtent=288,
    required this.itembuilder,
  });

  final int itemcount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itembuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemcount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: mainAxisExtent,
        crossAxisSpacing: TSizes.gridViewSpacing,
        mainAxisSpacing: TSizes.gridViewSpacing,
      ),
      itemBuilder: itembuilder,
    );
  }
}
