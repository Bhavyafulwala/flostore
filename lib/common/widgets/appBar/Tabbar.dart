import 'package:flutter/material.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/device/device_utility.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';
class TTabbar extends StatelessWidget implements PreferredSizeWidget {
  const TTabbar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: THelperFunctions.isDarkMode(context)?TColors.black:TColors.white,
      child: TabBar(
          isScrollable: true,
          indicatorColor: TColors.primary,
          labelColor: THelperFunctions.isDarkMode(context)?TColors.white:TColors.dark,
      unselectedLabelColor: TColors.darkGrey,
      tabs:tabs
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
