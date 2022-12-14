import 'package:calkitna_mobile_app/core/constants/colors.dart';
import 'package:calkitna_mobile_app/core/constants/strings.dart';
import 'package:calkitna_mobile_app/core/constants/style.dart';
import 'package:calkitna_mobile_app/core/constants/svg_assets.dart';
import 'package:calkitna_mobile_app/core/others/screen_utils.dart';
import 'package:calkitna_mobile_app/core/services/auth_service.dart';
import 'package:calkitna_mobile_app/locator.dart';
import 'package:calkitna_mobile_app/ui/custom_widgets/image_container.dart';
import 'package:calkitna_mobile_app/ui/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../core/services/locato_storage_service.dart';
import 'auth_screens/login/login_screen.dart';
import 'auth_screens/signup/signup_screen.dart';
import 'onboarding/onboarding_screens.dart';

final _authService = locator<AuthService>();
//final _localStorageService = locator<LocalStorageService>();

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init() async {
    // // await _localStorageService.init();
    // await _authService.init();
    // if (_authService.isLogin) {
    //   if (_authService.appUser.id != null) {
    //     Get.offAll(() => const OnboardingScreen());
    //   } else {
    //     Get.offAll(() => LoginScreen());
    //   }
    // } else {
    //   // SignUpScreen
    //   Get.offAll(() => const SignUpScreen());
    // }
    //
    // await Future.delayed(const Duration(seconds: 2));
    // // Get.offAll(() => const OnboardingScreen());
    // Get.offAll(() => const SignUpScreen());
    Future.delayed(const Duration(seconds: 5,),
        ()

        {
          print('this is new screen');
          Get.offAll(() => SplashScreen_02());
        }
    );

  }


  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      backgroundColor: Colors.white,

      body: Center(child: Container(child: Image.asset("assets/static_assets/logo_gokartz.png",height: 304.h,width: 304.w,),),),
    );
  }
}
