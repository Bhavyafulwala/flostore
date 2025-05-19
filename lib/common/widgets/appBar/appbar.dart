import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/device/device_utility.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

class TAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TAppbar({
    super.key,
  this.title,
    this.showbackarrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnpressed,

  });

  final Widget? title;
  final bool showbackarrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnpressed;

  @override
  Widget build(BuildContext context) {
    final isdark=THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        leading:
            showbackarrow
                ? IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Iconsax.arrow_left,color: isdark?TColors.white:TColors.black,),
                )
                :leadingIcon!=null? IconButton(
                  onPressed: leadingOnpressed,
                  icon: Icon(leadingIcon),
                ):null,
        title: title,
        actions: actions ,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
