import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/common/widgets/appBar/appbar.dart';
import 'package:mystore/features/personalisation/screens/address/Widgets/single_address.dart';
import 'package:mystore/features/personalisation/screens/address/add_new_address.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class TAddressScreen extends StatelessWidget {
  const TAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed:()=>Get.to(()=>AddNewAddressScreen()),backgroundColor: TColors.primary,
      child: Icon(Icons.add,color: TColors.white,),),
      appBar: TAppbar(showbackarrow:true,title: Text("Addresses",style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          TSingleAddress(selectedAddress: true),
          TSingleAddress(selectedAddress: false),
        ],
      ),),
    );
  }
}
