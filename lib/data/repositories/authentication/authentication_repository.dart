import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mystore/data/repositories/user/user_repository.dart';
import 'package:mystore/features/authentication/screens/login/login.dart';
import 'package:mystore/features/authentication/screens/onboarding/onboarding.dart';
import 'package:mystore/features/authentication/screens/signup/verify_email.dart';
import 'package:mystore/navigation_menu.dart';
import 'package:mystore/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:mystore/utils/exceptions/firebase_exception.dart';
import 'package:mystore/utils/exceptions/format_exception.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance=>Get.find();

  final deviceStorage=GetStorage();
  final _auth=FirebaseAuth.instance;

  ///Get Authenticated USer Data
  User? get authUser=> _auth.currentUser;

  @override
  void onReady() {
    //
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async{
    final user=_auth.currentUser;
    if(user!=null){
      if(user.emailVerified){
        Get.offAll(()=>const NavigationMenu());
      }else{
        Get.offAll(()=>VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    }else{
      deviceStorage.writeIfNull("IsFirstTime", true);
      deviceStorage.read("IsFirstTime")!=true?Get.offAll(()=>const LoginScreen()):Get.offAll(()=>OnBoardingScreen());

    }


  }

  // ------------------------Email and Password and SignIN--------------------
                   ///SignIn-Auth
  Future<UserCredential> loginWithEmailAndPassword(String email,String password)async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw"Something went wrong,please try again";

    }
  }
                  ///Register-Auth
  Future<UserCredential> registerWithEmailAndPassword(String email,String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw"Something went wrong,please try again";

  }

  }

         /// Email Verification

  Future<void> sendEmailVerification()async{
    try{
      await _auth.currentUser?.sendEmailVerification();
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw"Something went wrong,please try again";

    }
  }
        /// Google Authentication

  Future<UserCredential> signInWithGoogle()async{
    try{
      //Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      //getting auth details
      final GoogleSignInAuthentication? googleAuth=await userAccount?.authentication;
      //create a new credential
      final credential=GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken,idToken: googleAuth?.idToken);

      return await _auth.signInWithCredential(credential);
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw"Something went wrong,please try again";
    }
  }

     /// SendPasswordResetEmail-ForgetPAssword
  Future<void> sendPasswordResetEmail(String email)async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw"Something went wrong,please try again";

    }
  }
  Future<void> reAuthenticateWithEmailandPassword(String email,String password)async{
    try{
      AuthCredential credential=EmailAuthProvider.credential(email: email, password: password);

      await _auth.currentUser!.reauthenticateWithCredential(credential);
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw"Something went wrong,please try again";

    }
  }
  ///Delete Account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again";
    }
  }


  ///LogOut
    Future<void> logout()async{
    try{
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=>const LoginScreen());
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch(e){
      throw"Something went wrong,please try again";

    }

  }



}