import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/widgets/appBar/appbar.dart';
import 'package:mystore/features/shop/screens/cart/Widgets/cart_items.dart';
import 'package:mystore/features/shop/screens/checkout/checkout.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppbar(
        title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child:TCartItems(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(onPressed: ()=>Get.to(()=>CheckoutScreen()), child: Text("Checkout \$256"))),
    );
  }
}

