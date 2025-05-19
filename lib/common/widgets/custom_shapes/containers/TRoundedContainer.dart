import 'package:flutter/cupertino.dart';
import 'package:mystore/utils/constants/colors.dart';

import '../../../../utils/constants/sizes.dart';

class Troundedcontainer extends StatelessWidget {
  const Troundedcontainer({
    super.key,
    this.width,
    this.height,
    this.radius=TSizes.cardRadiusLg,
    this.child,
    this.showBorder=false,
    this.bordercolor=TColors.borderPrimary,
    this.backgroundcolor=TColors.white,
    this.padding,
    this.margin,
  });

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color bordercolor;
  final Color backgroundcolor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder?Border.all(color: bordercolor):null
      ),
      child: child,
    );
  }
}
