import 'package:flutter/material.dart';
import 'package:mystore/common/widgets/layouts/gridlayout.dart';
import 'package:mystore/common/widgets/products/product_cards/product_vertical_card.dart';
import 'package:mystore/common/widgets/texts/section_heading.dart';
import 'package:mystore/features/shop/models/ProductModel.dart';
import 'package:mystore/features/shop/models/category_model.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class Tcategorytab extends StatelessWidget {
  const Tcategorytab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:[ Padding(
        padding:EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TBrandShowcase(images: [TImages.productImage1,TImages.productImage2,TImages.productImage3],),
            const SizedBox(height: TSizes.spaceBtwItems,),

            TsectionHeadingBut(title: "You might like",showActionButton: true,onpressed: (){},),
            const SizedBox(height: TSizes.spaceBtwItems,),

            TGridlayout(itemcount: 4, itembuilder: (_,index)=>TProductCartVertical(product:ProductModel.empty(),))
          ],
        ),),]
    );
  }
}
