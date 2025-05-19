import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mystore/features/personalisation/controllers/user_controller.dart';
import 'package:mystore/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/Circular_image.dart';

class TUserProfilTile extends StatelessWidget {
  const TUserProfilTile({
    super.key, this.onpressed,
  });

final VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    final isdark=THelperFunctions.isDarkMode(context);
    return ListTile(
      leading: TCircularimage(image: TImages.user,width: 50,height: 50,padding: 0,),
      title: Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.bodySmall!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: onpressed, icon:  Icon(Iconsax.edit,color:isdark?TColors.white:TColors.black,)),
    );
  }
}
