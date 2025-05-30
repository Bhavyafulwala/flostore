import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/sizes.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.actionText,
    this.onActionPressed,
    this.showAction=false,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(animation, width: MediaQuery
              .of(context)
              .size
              .width * 0.8),
          const SizedBox(height: TSizes.defaultSpace,),
          Text(
            text,
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.defaultSpace,),
          showAction
              ? SizedBox(width: 250,
            child: OutlinedButton(
                onPressed: onActionPressed,
                child: Text(actionText!, style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium!.apply(
                  color: TColors.light
                ),)),)
          : const SizedBox(),
        ],
      ),
    );
  }
}
