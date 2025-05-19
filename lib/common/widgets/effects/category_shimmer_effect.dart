import 'package:flutter/cupertino.dart';
import 'package:mystore/common/widgets/effects/t_shimmer_effect.dart';
import 'package:mystore/utils/constants/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_,__) => const SizedBox(width: TSizes.spaceBtwItems),
        itemBuilder: (_, index) {
          return const Column(
            children: [
              TShimmerEffect(width: 55, height: 55,radius: 55,),
              const SizedBox(height: TSizes.spaceBtwItems/2,),
              
              TShimmerEffect(width: 55, height: 8)
            ],
          );
        }
    )
      );
  }
}
