import 'package:flutter/material.dart';
import 'package:mystore/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key, required this.text, required this.selected, this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final iscolor=THelperFunctions.getColor(text)!=null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: iscolor?const SizedBox():Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected?TColors.white:null),
        avatar:iscolor
            ? TCircularContainer(width: 50,height: 50,backgrcolor: THelperFunctions.getColor(text)!)
            :null,
        shape: iscolor?const CircleBorder():null,
        labelPadding:iscolor? const EdgeInsets.all(0):null,
        padding:iscolor? const EdgeInsets.all(0):null,
        backgroundColor: iscolor?THelperFunctions.getColor(text)!:null
      ),
    );
  }
}



