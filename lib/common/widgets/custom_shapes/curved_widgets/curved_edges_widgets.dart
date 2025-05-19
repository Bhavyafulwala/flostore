import 'package:flutter/material.dart';
import 'package:mystore/common/widgets/custom_shapes/curved_widgets/curved_edges.dart';
class TCustomCurveWidget extends StatelessWidget {
  const TCustomCurveWidget({
    super.key, this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: TCurvedEdges(),
        child:child
    );
  }
}
