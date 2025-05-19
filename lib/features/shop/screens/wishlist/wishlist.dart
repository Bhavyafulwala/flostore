import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/common/widgets/appBar/appbar.dart';
import 'package:mystore/common/widgets/icons/TCircularIcon.dart';
import 'package:mystore/common/widgets/layouts/gridlayout.dart';
import 'package:mystore/common/widgets/products/product_cards/product_vertical_card.dart';
import 'package:mystore/features/shop/screens/home/home.dart';

import '../../../../utils/constants/sizes.dart';
import '../../models/ProductModel.dart';
class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: TAppbar(
        title: Text("WishList",style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
         t_circular_icon(icon:Iconsax.add,onpressed: ()=>Get.to(const HomeScreen()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding:EdgeInsets.all(TSizes.defaultSpace) ,
        child: TGridlayout(itemcount: 6, itembuilder: (_,index)=>TProductCartVertical(product: ProductModel.empty(),)),),
      ),

    );
  }
}
