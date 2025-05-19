import 'package:flutter/material.dart';
import 'package:mystore/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:mystore/common/widgets/products/rating/rating_indicator.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constants/image_strings.dart';

class TUserReviewCard extends StatelessWidget {
  const TUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark=THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Row(
            children: [
              const CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage1),),
              const SizedBox(width: TSizes.spaceBtwItems,),
              Text("Bhavya Fulwala",style: Theme.of(context).textTheme.titleLarge,)
            ],
          ),
            IconButton(onPressed: (){}, icon:const Icon(Icons.more_vert))
    ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(children:[
          TRatingBarIndicator(rating: 4),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Text('01 Nov 2005',style: Theme.of(context).textTheme.bodyMedium,)
    ],),
        const SizedBox(height: TSizes.spaceBtwItems,),
        ReadMoreText("The best app i have shown with having best products with ease shopping experience.Thanks",
        trimLines: 1,
        trimExpandedText: " Show less",
        trimMode: TrimMode.Line,
        trimCollapsedText: " Show more",
        colorClickableText: TColors.primary,),
        const SizedBox(height: TSizes.spaceBtwItems,),
        Troundedcontainer(
          backgroundcolor: isdark?TColors.darkGrey:TColors.grey,
          child: Padding(
              padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("T's Store",style: Theme.of(context).textTheme.titleMedium,),
                  Text("05 Nov 2005",style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwItems,),
              ReadMoreText("The best app i have shown with having best products with ease shopping experience.Thanks",
                trimLines: 1,
                trimExpandedText: " Show less",
                trimMode: TrimMode.Line,
                trimCollapsedText: " Show more",
                colorClickableText: TColors.primary,),
            ],
          ),)
          ,
        )
      ],
    );
  }
}
