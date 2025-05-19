import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/features/authentication/screens/onboarding/widgets/OnBoarding_dot_nav.dart';
import 'package:mystore/features/authentication/screens/onboarding/widgets/onboarding_button.dart';
import 'package:mystore/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:mystore/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:mystore/utils/constants/image_strings.dart';
import 'package:mystore/utils/constants/text_strings.dart';

import '../../controllers/onboarding/onboarding.controller.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          //horizontal scroll pages
          PageView(
            controller: controller.pagecongtroller,
            onPageChanged: controller.UpdatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          //Skip button
          const OnBoardingSkip(),
          OnBoardingNavdot(),
          onboarding_button(),
        ],
      ),
    );
  }
}

