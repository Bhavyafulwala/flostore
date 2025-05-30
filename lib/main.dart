import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mystore/features/authentication/screens/onboarding/onboarding.dart';
import 'package:mystore/utils/theme/theme.dart';

import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  /// Add widgets binding
  final WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();

  ///Getx Local Storage
  await GetStorage.init();

  ///Await Splash untill other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);






  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then(
      (FirebaseApp value)=>Get.put(AuthenticationRepository())
  );
  runApp(const MyApp());
}


