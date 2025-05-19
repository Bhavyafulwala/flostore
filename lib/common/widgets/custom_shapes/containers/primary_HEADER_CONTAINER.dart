import 'package:flutter/material.dart';
import 'package:mystore/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:mystore/common/widgets/custom_shapes/curved_widgets/curved_edges_widgets.dart';
import 'package:mystore/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCustomCurveWidget(
      child: Container(
        color: TColors.primary,
        padding: EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(
                backgrcolor: TColors.textWhite.withOpacity(0.16),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                backgrcolor: TColors.textWhite.withOpacity(0.16),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}