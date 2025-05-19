import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/common/widgets/appBar/appbar.dart';
import 'package:mystore/common/widgets/effects/t_shimmer_effect.dart';
import 'package:mystore/common/widgets/images/Circular_image.dart';
import 'package:mystore/common/widgets/texts/section_heading.dart';
import 'package:mystore/features/personalisation/controllers/user_controller.dart';
import 'package:mystore/features/personalisation/screens/profile/widgets/profile_menu.dart';
import 'package:mystore/utils/constants/sizes.dart';

import '../../../../utils/constants/image_strings.dart';
import 'change/change_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    return Scaffold(
      appBar: TAppbar(showbackarrow: true,title: Text("Profile"),),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Obx((){
                    final networkImage=controller.user.value.profilePicture;
                    final image=networkImage.isNotEmpty?networkImage:TImages.user;
                    return controller.imageuploading.value
                        ?const TShimmerEffect(width: 80, height: 80,radius: 80,)
                        : TCircularimage(image: image,width: 80,height: 80,isNetworkImage: networkImage.isNotEmpty,);}),
                  TextButton(onPressed: ()=>controller.uploadUserProfilePicture(), child: Text("Change Profile Picture")),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems /2,),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems,),
            const TsectionHeadingBut(title: "Profile Information",showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems,),

            TprofileMenu(title: "Name",value: controller.user.value.fullName,onpressed:()=>Get.to(()=>ChangeName()),),
            TprofileMenu(title: "Username",value:controller.user.value.username,onpressed: (){},),
            const SizedBox(height: TSizes.spaceBtwItems,),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems,),
            const TsectionHeadingBut(title: "Personal Information",showActionButton: false,),
            const SizedBox(height: TSizes.spaceBtwItems,),

            TprofileMenu(title: "UserId",value:controller.user.value.id,onpressed: (){},icon: Iconsax.copy,),
            TprofileMenu(title: "E-mail",value: controller.user.value.email,onpressed: (){},),
            TprofileMenu(title: "Phone number",value:controller.user.value.phoneNumber,onpressed: (){},),
            TprofileMenu(title: "Gender",value: "Male",onpressed: (){},),
            TprofileMenu(title: "Date of birth",value: "06 Sept 2003",onpressed: (){},),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems,),

            Center(child: TextButton(onPressed:controller.deleteAccountWarningPoppup, child: Text("close account",style: TextStyle(color:Colors.red),)))

          ],
        ),),
      ),
    );
  }
}

