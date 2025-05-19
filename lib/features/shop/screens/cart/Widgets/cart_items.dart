import 'package:flutter/material.dart';
import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../product_dtails/Widgets/product_price_text.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showaddandremovebuttons=true});

  final bool showaddandremovebuttons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (_, __) =>
        const SizedBox(height: TSizes.spaceBtwSections,),
        itemCount: 6,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) =>
            Column(
              children: [
                TCartItem(),
                if(showaddandremovebuttons)const SizedBox(height: TSizes.spaceBtwItems,),
                if(showaddandremovebuttons)Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children:
                      [
                        const SizedBox(width: 70,),
                        TProductQuantitywithAddandRemove(),
                      ],),
                    TProductPriceText(price: "256")

                  ],
                )
              ],
            )
    );
  }
}
