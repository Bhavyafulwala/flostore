import 'package:flutter/material.dart';
import 'package:mystore/common/widgets/custom_shapes/containers/TRoundedContainer.dart';
import 'package:mystore/features/shop/screens/cart/Widgets/cart_items.dart';
import 'package:mystore/features/shop/screens/checkout/Widgets/billing_address_section.dart';
import 'package:mystore/features/shop/screens/checkout/Widgets/billing_payment_section.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/constants/sizes.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appBar/appbar.dart';
import '../../../../common/widgets/products/cart/Coupon_widget.dart';
import 'Widgets/billing_amount_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isdark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Items in cart
              TCartItems(showaddandremovebuttons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              //coupon textfield
              TCouponcode(),
              const SizedBox(height: TSizes.spaceBtwSections,),

              ///billing section

              Troundedcontainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundcolor: isdark?TColors.black:TColors.white,
                child: Column(
                  children: [

                    ///Pricing
                    const TBillingAmountSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                      ///Divider
                      const Divider(),
                      const SizedBox(height: TSizes.spaceBtwItems,),

                    ///Payment methods
                    const TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwItems,),

                    ///address

                    const TBillingAddressSection(),
                    const SizedBox(height: TSizes.spaceBtwItems,),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

