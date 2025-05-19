import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mystore/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:mystore/common/widgets/texts/section_heading.dart';
import 'package:mystore/features/shop/models/ProductModel.dart';
import 'package:mystore/features/shop/screens/product_dtails/Widgets/product_price_text.dart';
import 'package:mystore/features/shop/screens/product_dtails/Widgets/product_title_text.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../controllers/Products/variation_controller.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(VariationController());
    final isdark = THelperFunctions.isDarkMode(context);
    return Obx(()=>Column(
        children: [
          if(controller.selectedVariation.value.id.isNotEmpty)
          Troundedcontainer(
            padding: const EdgeInsets.all(TSizes.md),
            backgroundcolor: isdark ? TColors.darkGrey : TColors.grey,
            child: Column(
              children: [
                Row(
                  children: [
                    TsectionHeadingBut(
                      title: "Variation",
                      showActionButton: false,
                    ),
                    SizedBox(width: TSizes.spaceBtwItems),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TProductTitleText(title: "Price : ", isSmall: true),

                            //Actual Price
                            if(controller.selectedVariation.value.price>0)
                            Text(
                              '\$${controller.getVariationPrice()}',
                              style: Theme.of(context).textTheme.titleSmall!
                                  .apply(decoration: TextDecoration.lineThrough),
                            ),
                            SizedBox(width: TSizes.spaceBtwItems),
                            TProductPriceText(price:controller.getVariationPrice()),
                          ],
                        ),
                        // stock
                        Row(
                          children: [
                            TProductTitleText(
                              title:controller.variationStockStatus.value,
                              isSmall: true,
                            ),
                            Text(
                              "In Stock",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const TProductTitleText(
                  title: "This the description of the product with max 4 lines",
                  isSmall: true,
                  maxlines: 4,
                ),
              ],
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems/2.5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children:product.productAttributes!.map((attribute)=>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TsectionHeadingBut(title:attribute.name??'',showActionButton: false,),
                const SizedBox(height: TSizes.spaceBtwItems / 3),
               Obx(()=>Wrap(
                   spacing: 8,
                   children: attribute.values!.map((attributeValue) {
                     final isSelected=controller.selectedAttributes[attribute.name]==attributeValue;
                     final available=controller
                          .getAttributesAvailabilityInVariation(product.productVariations!,attribute.name!).contains(attributeValue);
                     return TChoiceChip(text: attributeValue, selected: isSelected, onSelected:available
                         ? (selected) {
                           if(selected && available){
                             controller.onAttributeSelected(product,attribute.name??'',attributeValue);
                           }
                     }
                     :null
                     );
                   }).toList()

                 ),
               )
              ],
            )).toList(),
          ),

        ],
      ),
    );
  }
}


