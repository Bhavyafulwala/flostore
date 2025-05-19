import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/common/widgets/appBar/appbar.dart';
import 'package:mystore/features/personalisation/controllers/update_controller.dart';
import 'package:mystore/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppbar(
        showbackarrow: true,
        title: Text(
          "Change Name",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Use real name for easy verification.This name will appear on several pages",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),
              Form(
                key: controller.updateUserNameFormKey,
                  child:Column(
                    children: [
                      TextFormField(
                        controller: controller.firstName,
                        validator: (value)=>TValidator.validateEmptyText("First Name", value),
                        expands: false,
                        decoration: const InputDecoration(labelText: TTexts.firstName,prefixIcon: Icon(Iconsax.user)),
                      ),
                      const SizedBox(height: TSizes.spaceBtwInputFields,),
                      TextFormField(
                        controller: controller.lastName,
                        validator: (value)=>TValidator.validateEmptyText("Last Name", value),
                        expands: false,
                        decoration: const InputDecoration(labelText: TTexts.lastName,prefixIcon: Icon(Iconsax.user)),
                      ),
                    ],
                  ) ),
              const SizedBox(height: TSizes.spaceBtwSections,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()=>controller.updateUserName(), child: const Text("Save")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
