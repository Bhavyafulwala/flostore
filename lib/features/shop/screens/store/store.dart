
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mystore/common/widgets/appBar/Tabbar.dart';
import 'package:mystore/common/widgets/appBar/appbar.dart';
import 'package:mystore/common/widgets/brands/t_brand_cards.dart';
import 'package:mystore/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:mystore/common/widgets/effects/brand_shimmer_effect.dart';
import 'package:mystore/common/widgets/layouts/gridlayout.dart';
import 'package:mystore/features/shop/controllers/Products/brand_controller.dart';
import 'package:mystore/features/shop/controllers/category_controller.dart';
import 'package:mystore/features/shop/screens/brands/brand_products.dart';
import 'package:mystore/features/shop/screens/store/Widgets/category_tab.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../brands/all_brands.dart';
import 'Models/brandModel_mockdata.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final brandController=Get.put(BrandController());
    final categories=CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppbar(
          title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
          actions: [TCartCounterItems(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxisscrollable) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor:
                    THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: TSizes.spaceBtwItems),
                      TSearchContainer(
                        text: '',
                        showborder: true,
                        showBackgroundcolor: false,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: TSizes.spaceBtwSections),
                      TsectionHeadingBut(
                        title: 'Featured Brands',
                        onpressed: ()=>Get.to(()=>AllBrands()),
                      ),
                      SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      Obx((){
                        if(brandController.isLoading.value)return TBrandShimmer();
                        if(brandController.featuredBrands.isEmpty){
                          return const Center(child: Text("No Data Found!"));
                        }
                        return TGridlayout(
                          itemcount: brandController.featuredBrands.length,
                          mainAxisExtent: 80,
                          itembuilder: (_, index) {
                            final brand=brandController.featuredBrands[index];
                            return TBrandCard(
                              brand: brand,
                              showBorder: true,
                              onTap: ()=>Get.to(()=>BrandProducts(brand: brand)),
                            );
                          },
                        );
                      },
                      )
                    ],
                  ),
                ),
      
                bottom: TTabbar(tabs:categories.map((category)=>Tab(child: Text(category.name))).toList(),
              ),
              )];
          },
          body: TabBarView(children: categories.map((category)=>Tcategorytab(category: category)).toList()
          ),
        ),
      ),
    );
  }
}

