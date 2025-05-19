import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/bindings/general_bindings.dart';
import 'package:mystore/utils/constants/colors.dart';
import 'package:mystore/utils/routes/app_routes.dart';
import 'package:mystore/utils/theme/theme.dart';

import 'features/authentication/screens/onboarding/onboarding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lighttheme,
      darkTheme: TAppTheme.darktheme ,
      getPages: AppRoutes.pages,
      initialBinding: GeneralBindings(),
      home:const Scaffold(backgroundColor: TColors.primary,body: CircularProgressIndicator(color: Colors.white,),));
  }
}

