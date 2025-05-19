import 'package:flutter/material.dart';
import 'package:mystore/utils/constants/colors.dart';
class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width=400,
    this.height=400,
    this.radius=400,
    this.padding=0,
    this.child,
    this.backgrcolor=TColors.white,
    this.margin,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgrcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin:margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgrcolor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
