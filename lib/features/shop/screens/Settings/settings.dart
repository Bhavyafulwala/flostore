import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/common/widgets/ListTiles/settings_menu_tile.dart';
import 'package:mystore/common/widgets/appBar/appbar.dart';
import 'package:mystore/common/widgets/custom_shapes/containers/primary_HEADER_CONTAINER.dart';
import 'package:mystore/common/widgets/texts/section_heading.dart';
import 'package:mystore/data/repositories/authentication/authentication_repository.dart';
import 'package:mystore/features/personalisation/screens/address/address.dart';
import 'package:mystore/features/personalisation/screens/profile/profile.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/ListTiles/user_profileTile.dart';
import '../../../../utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(AuthenticationRepository());
    final isdark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppbar(
                    title: Text(
                      "Account",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  TUserProfilTile(onpressed:()=>Get.to(()=>const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TsectionHeadingBut(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(icon: Iconsax.safe_home,title:"My Addresses",subtitle:"Set shopping delivery address", onTap: ()=>Get.to(()=>TAddressScreen()),),
                  TSettingsMenuTile(icon: Iconsax.shopping_cart,title:"My Cart",subtitle:"Add,Remove products and move to checkout", onTap: (){},),
                  TSettingsMenuTile(icon: Iconsax.bag_tick,title:"My Orders",subtitle:"In-Progress and Completed Orders", onTap: (){},),
                  TSettingsMenuTile(icon: Iconsax.bank,title:"Bank Account",subtitle:"Withdraw Balance to Registered Bank Account", onTap: (){},),
                  TSettingsMenuTile(icon: Iconsax.discount_shape,title:"My Coupons",subtitle:"List of All Discounted Coupons", onTap: (){},),
                  TSettingsMenuTile(icon: Iconsax.notification,title:"Notifications",subtitle:"Set Any Kind of Notification Message", onTap: (){},),
                  TSettingsMenuTile(icon: Iconsax.security_card,title:"Account Privacy",subtitle:"Manage data usage and connected Accounts", onTap: (){},),
                  SizedBox(height: TSizes.spaceBtwSections,),
                  const TsectionHeadingBut(title: "App Settings",showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  TSettingsMenuTile(icon:Icons.upload_file, title:"Load Data", subtitle:"Upload Data to your Database"),
                  TSettingsMenuTile(icon:Iconsax.location, title:"Geolocation", subtitle:"Set recommendation based on Location",trailing: Switch(value: true, onChanged: (value){}),),
                  TSettingsMenuTile(icon:Iconsax.security_user, title:"Safe Mode", subtitle:"Search Result is Safe for all ages",trailing: Switch(value: true, onChanged: (value){}),),
                  TSettingsMenuTile(icon:Iconsax.image, title:"HD Image Quality", subtitle:"Set image quality to be seen",trailing: Switch(value: false, onChanged: (vlaue){}),),
                  
                  const SizedBox(height: TSizes.spaceBtwSections,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: ()=>controller.logout(), child: const Text("Logout")),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections*2.5,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
