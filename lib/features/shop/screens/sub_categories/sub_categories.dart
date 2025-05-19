import 'package:flutter/material.dart';
import 'package:mystore/common/widgets/appBar/appbar.dart';
import 'package:mystore/common/widgets/images/t_rounded_images.dart';
import 'package:mystore/common/widgets/products/product_cards/product_horizontal_card.dart';
import 'package:mystore/common/widgets/texts/section_heading.dart';


import 'package:mystore/utils/constants/sizes.dart';
import '../../../../utils/constants/image_strings.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(title: Text("Sports shirts"),showbackarrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
            children: [
              ///Banner
              TRoundedImage(imageUrl: TImages.banner5,width: double.infinity,applyImageRadius: true,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              ///sub category
              Column(
                children: [
                  TsectionHeadingBut(title:"Sports Shirts",onpressed: (){}, ),
                  const SizedBox(height: TSizes.spaceBtwItems/2,),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemBuilder:(context,index)=>const TProductCardHorizontal(),
                    separatorBuilder: (context,index)=>const SizedBox(width: TSizes.spaceBtwItems,),
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,),
                  )
                ],
              )
          ],
        ),),
      ),
    );
  }
}
