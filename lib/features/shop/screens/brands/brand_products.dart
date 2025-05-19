import 'package:flutter/material.dart';
import 'package:mystore/common/widgets/appBar/appbar.dart';
import 'package:mystore/common/widgets/brands/t_brand_cards.dart';
import 'package:mystore/common/widgets/effects/vertical+product_shimmer.dart';
import 'package:mystore/common/widgets/products/sortable/soretable_products.dart';
import 'package:mystore/features/shop/controllers/Products/brand_controller.dart';
import 'package:mystore/features/shop/models/brandModel.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../../../common/widgets/effects/brand_shimmer_effect.dart';
import '../store/Models/brandModel_mockdata.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller=BrandController.instance;
    return Scaffold(
      appBar: TAppbar(title: Text("Nike"),),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TBrandCard(brand: demoBrands[0],showBorder: true,),
            const SizedBox(height: TSizes.spaceBtwSections,),
            FutureBuilder(
              future:controller.getBrandProducts(brand.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const TVerticalProductShimmer();
                }

                // Handle errors
                if (snapshot.hasError) {
                  return const Center(child: Text("Something went wrong!"));
                }

                // Handle no data or empty product list
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No products found for this brand."));
                } 
                 final brandProducts=snapshot.data!;
                return TSortableProducts(products:brandProducts);
              }
            )
          ],
        ),),
      ),
    );
  }
}
