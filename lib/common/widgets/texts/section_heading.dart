import 'package:flutter/material.dart';

class TsectionHeadingBut extends StatelessWidget {
  const TsectionHeadingBut({
    super.key,  this.textcolor,  this.showActionButton=true, required this.title,  this.buttontilte="View all",  this.onpressed,
  });

  final Color? textcolor;
  final bool showActionButton;
  final String title,buttontilte;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children:[ Text(title,style: Theme.of(context).textTheme.headlineSmall!.apply(color: textcolor),maxLines: 1,overflow: TextOverflow.ellipsis,),
      if(showActionButton)TextButton(onPressed:onpressed, child:Text(buttontilte)),
    ]);
  }
}