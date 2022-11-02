import 'package:calkitna_mobile_app/core/constants/colors.dart';
import 'package:calkitna_mobile_app/core/constants/strings.dart';
import 'package:calkitna_mobile_app/core/constants/style.dart';
import 'package:calkitna_mobile_app/core/constants/svg_assets.dart';
import 'package:calkitna_mobile_app/core/others/screen_utils.dart';
import 'package:calkitna_mobile_app/core/services/auth_service.dart';
import 'package:calkitna_mobile_app/locator.dart';
import 'package:calkitna_mobile_app/ui/custom_widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../core/services/locato_storage_service.dart';

import 'screens/auth_screens/logInAs.dart';
import 'screens/auth_screens/login/login_screen.dart';

final _authService = locator<AuthService>();
//final _localStorageService = locator<LocalStorageService>();

class SplashScreen_02 extends StatefulWidget {
  const SplashScreen_02({Key? key}) : super(key: key);

  @override
  State<SplashScreen_02> createState() => _SplashScreen_02();
}

class _SplashScreen_02 extends State<SplashScreen_02> {
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
    Future.delayed(const Duration(seconds: 3,),
            ()

        {
          print('this is new screen');
          Get.offAll(() => LogInAs());
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
      backgroundColor: Colors.white,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 75.h,),
          Spacer(),
          Container(child: Image.asset("assets/static_assets/logo_gokartz.png",height: 304.h,width: 304.w,),),
          // SizedBox(height: 5.h,),
          Container(child: Image.asset("assets/static_assets/loading.png",height: 214.h,width: 236.w,),),

        ],
      ),),
    );
  }
}
