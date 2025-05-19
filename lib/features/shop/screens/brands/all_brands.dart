import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mystore/common/widgets/appBar/appbar.dart';
import 'package:mystore/common/widgets/brands/t_brand_cards.dart';
import 'package:mystore/common/widgets/effects/brand_shimmer_effect.dart';
import 'package:mystore/common/widgets/layouts/gridlayout.dart';
import 'package:mystore/common/widgets/texts/section_heading.dart';
import 'package:mystore/features/shop/controllers/Products/brand_controller.dart';
import 'package:mystore/features/shop/screens/brands/brand_products.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../../../common/widgets/products/sortable/soretable_products.dart';
import '../store/Models/brandModel_mockdata.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController=BrandController.instance;
    return Scaffold(
      appBar: TAppbar(title: Text("Brands"),showbackarrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
        child:Column(
          children: [
            TsectionHeadingBut(title: "Brands", showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Obx((){
              if(brandController.isLoading.value)return TBrandShimmer();
              if(brandController.featuredBrands.isEmpty){
                return const Center(child: Text("No Data Found!"));
              }
              return TGridlayout(
                  itemcount: brandController.allBrands.length,
                  mainAxisExtent: 80,
                  itembuilder: (context, index) {
                    final brand=brandController.allBrands[index];
                    return TBrandCard(brand:brand,showBorder: true,
                      onTap: () => Get.to(() => BrandProducts(brand: brand,)),);
                  }
              );
            }
            )
          ],
        )),
      ),
    );
  }
}




