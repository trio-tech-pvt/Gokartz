import 'package:calkitna_mobile_app/core/constants/colors.dart';
import 'package:calkitna_mobile_app/core/constants/strings.dart';
import 'package:calkitna_mobile_app/core/constants/style.dart';
import 'package:calkitna_mobile_app/core/constants/svg_assets.dart';
import 'package:calkitna_mobile_app/core/others/screen_utils.dart';
import 'package:calkitna_mobile_app/core/services/auth_service.dart';
import 'package:calkitna_mobile_app/locator.dart';
import 'package:calkitna_mobile_app/ui/custom_widgets/image_container.dart';
import 'package:flutter/material.dart';
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
    Future.delayed(Duration(seconds: 3,),
        ()

        {
          print('this is new screen');
          Get.offAll(() => LoginScreen());
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
    return Scaffold(
      body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Stack(
            children: [
              SvgAssets.splashScreen,
              Align(
                alignment: Alignment.center,
                child: Center(child: SvgAssets.logo),
              ),
              Positioned(
                top: 1.sh - 60,
                child: SizedBox(
                  width: 1.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('CalKitna',
                          style: headingTextStyleFutura.copyWith(
                              fontSize: 19.sp,
                              color: blackColor.withOpacity(0.1))),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
