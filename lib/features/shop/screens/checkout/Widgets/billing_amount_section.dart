import 'package:flutter/material.dart';
import 'package:mystore/utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$256.0",style: Theme.of(context).textTheme.bodyMedium,),],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        ///shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping fee",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$6.0",style: Theme.of(context).textTheme.labelLarge,),],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        ///taxfee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax fee",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$2.0",style: Theme.of(context).textTheme.labelLarge,),],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        ///order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order total",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$300",style: Theme.of(context).textTheme.titleMedium,),],
        ),
      ],
    );
  }
}
