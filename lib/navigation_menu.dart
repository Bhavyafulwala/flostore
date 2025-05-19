import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/features/shop/screens/Settings/settings.dart';
import 'package:mystore/features/shop/screens/home/home.dart';
import 'package:mystore/features/shop/screens/store/store.dart';
import 'package:mystore/features/shop/screens/wishlist/wishlist.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(Navigationcontroller());
    final dark=THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          elevation: 0,
          selectedIndex: controller.selectedindex.value,
          onDestinationSelected: (index)=>controller.selectedindex.value=index,
          backgroundColor: dark?TColors.black:TColors.white,
          indicatorColor: dark?TColors.white.withOpacity(0.1):TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(()=> controller.screens[controller.selectedindex.value]),
    );
  }
}

class Navigationcontroller extends GetxController{
  final Rx<int> selectedindex=0.obs;

  final screens=[const HomeScreen(),const StoreScreen(),const WishlistScreen(),const SettingsScreen()];

}
