import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../images/Circular_image.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key, required this.image, required this.title,  this.textcolor=TColors.white, this.backgroungcolors, this.OnTap, this.isNetworkImage=true,
  });

  final String image,title;
  final Color textcolor;
  final Color? backgroungcolors;
  final bool isNetworkImage;
  final void Function()? OnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:OnTap,
      child: Padding(
        padding: const EdgeInsets.only(
          right: TSizes.spaceBtwItems,
        ),
        child: Column(
          children: [
            TCircularimage(
              height: 54,
              image: image,
              fit: BoxFit.fitWidth,
              padding: TSizes.sm ,
              isNetworkImage: isNetworkImage,
              backgroundcolor: backgroungcolors,
              overlaycolor: THelperFunctions.isDarkMode(context)?TColors.light:TColors.dark,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems/2,
            ),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color:textcolor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
