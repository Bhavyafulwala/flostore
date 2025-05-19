import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mystore/common/widgets/effects/t_shimmer_effect.dart';
import 'package:mystore/features/personalisation/controllers/user_controller.dart';

import '../../../../../common/widgets/appBar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class THomeAppbar extends StatelessWidget {
  const THomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UserController());
    return TAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: TColors.grey),
          ),
          Obx((){
            if(controller.profileLoading.value){
              return TShimmerEffect(width: 80, height: 15,);
            }else {
              return Text(controller.user.value.fullName, style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white));
            }}),
        ],
      ),
      actions: [
        TCartCounterItems(onPressed: () {}, Iconcolor: TColors.white, ),
      ],
    );
  }
}

