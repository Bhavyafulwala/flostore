import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mystore/common/styles/spacing_styles.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../../../utils/constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onpressed});

  final String image,title,subtitle;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Padding(
            padding: Tspacingstyle.paddingwithappbarheight*2,
        child:Column(
          children: [
            Lottie.asset(image,width: MediaQuery.of(context).size.width*0.6),
            const SizedBox(height: TSizes.spaceBtwSections,),
            
            Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text(subtitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwSections,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed:onpressed, child: Text(TTexts.tContinue)),
            )

          ],
        ) ,),
      ),
    );
  }
}
