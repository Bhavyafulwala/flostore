import 'package:flutter/material.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/device/device_utility.dart';

import '../../../controllers/onboarding/onboarding.controller.dart';
class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(onPressed: () {
        OnBoardingController.instance.skipPage();
      }, child: const Text("Skip")),
    );
  }
}