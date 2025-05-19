import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/common/widgets/appBar/appbar.dart';
import 'package:mystore/common/widgets/effects/vertical+product_shimmer.dart';
import 'package:mystore/common/widgets/layouts/gridlayout.dart';
import 'package:mystore/common/widgets/products/product_cards/product_vertical_card.dart';
import 'package:mystore/features/shop/controllers/Products/allproducts_controller.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../../common/widgets/products/sortable/soretable_products.dart';
import '../models/ProductModel.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(AllProductsController());
    return Scaffold(
      appBar: TAppbar(title:Text(title),showbackarrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: FutureBuilder(
            future:futureMethod??controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              const loader=TVerticalProductShimmer();
              if(snapshot.connectionState==ConnectionState.waiting){
                return loader;
              }
              if(!snapshot.hasData||snapshot.data==null||snapshot.data!.isEmpty){
                return const Center(child: Text("No Data Found!"));
              }
              if(snapshot.hasError){
                return const Center(child: Text("Something went wrong!"));
              }
              final products=snapshot.data!;
            return TSortableProducts(products:products,);
          }
        ),),
      ),
    );
  }
}

