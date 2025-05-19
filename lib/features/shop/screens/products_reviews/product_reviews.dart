import 'package:flutter/material.dart';
import 'package:mystore/common/widgets/appBar/appbar.dart';
import 'package:mystore/features/shop/screens/products_reviews/Widgets/user_review_card.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../../../common/widgets/products/rating/rating_indicator.dart';
import 'Widgets/rating_progressindicator.dart';

class TProductReviewsScreen extends StatelessWidget {
  const TProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(title: Text("Reviews and Ratings"),showbackarrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ratings and Reviews are verified and are from people who use same type of device that you use"),
              const SizedBox(height: TSizes.spaceBtwItems,),

              //overall products rating
             const TOverallProductRating(),
              TRatingBarIndicator(rating: 3.6,),
              Text('12,611',style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              TUserReviewCard(),
              const SizedBox(height: TSizes.spaceBtwSections,),
              TUserReviewCard(),
              const SizedBox(height: TSizes.spaceBtwSections,),
              TUserReviewCard(),


            ],
        ),),

      ),
    );
  }
}


