import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/features/shop/controllers/Products/allproducts_controller.dart';

import '../../../../features/shop/models/ProductModel.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/gridlayout.dart';
import '../product_cards/product_vertical_card.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(decoration:const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        value: controller.SelectedSortOption.value,
        onChanged:(value){
            controller.sortProducts(value!);
            },
          items: ["Name","Higher Price",'Lower Price',"Sale","Newest","Popularity"]
                .map((option)=>DropdownMenuItem(child: Text(option),value:option)).toList(),
             ),
        const SizedBox(height: TSizes.spaceBtwSections,),
        Obx(()=> TGridlayout(itemcount:controller.products.length, itembuilder: (_,index)=> TProductCartVertical(product: controller.products[index])))
      ],
    );
  }
}
