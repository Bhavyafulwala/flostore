import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mystore/common/widgets/ListTiles/user_profileTile.dart';
import 'package:mystore/features/authentication/screens/Password_configs/forget_password.dart';
import 'package:mystore/features/authentication/screens/login/login.dart';
import 'package:mystore/features/authentication/screens/onboarding/onboarding.dart';
import 'package:mystore/features/authentication/screens/signup/signup.dart';
import 'package:mystore/features/authentication/screens/signup/verify_email.dart';
import 'package:mystore/features/personalisation/screens/address/address.dart';
import 'package:mystore/features/shop/screens/Settings/settings.dart';
import 'package:mystore/features/shop/screens/cart/cart.dart';
import 'package:mystore/features/shop/screens/home/home.dart';
import 'package:mystore/features/shop/screens/products_reviews/product_reviews.dart';
import 'package:mystore/features/shop/screens/store/store.dart';
import 'package:mystore/features/shop/screens/wishlist/wishlist.dart';
import 'package:mystore/utils/routes/routes.dart';

class AppRoutes{
  static final pages=[
    GetPage(name: TRoutes.home, page:()=>const HomeScreen()),
    GetPage(name: TRoutes.store, page:()=>const StoreScreen()),
    GetPage(name: TRoutes.favourites, page:()=>const WishlistScreen()),
    GetPage(name: TRoutes.settings, page:()=>const SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page:()=>const TProductReviewsScreen()),
    GetPage(name: TRoutes.cart, page:()=>const CartScreen()),
    GetPage(name: TRoutes.userProfile, page:()=>const TUserProfilTile()),
    GetPage(name: TRoutes.userAddress, page:()=>const TAddressScreen()),
    GetPage(name: TRoutes.signUp, page:()=>const Signupscreen()),
    GetPage(name: TRoutes.verifyEmail, page:()=>const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page:()=>const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page:()=>const ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page:()=>const OnBoardingScreen()),
  ];
}