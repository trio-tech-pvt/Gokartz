import 'package:calkitna_mobile_app/core/constants/strings.dart';
import 'package:calkitna_mobile_app/core/constants/style.dart';
import 'package:calkitna_mobile_app/core/others/screen_utils.dart';
import 'package:calkitna_mobile_app/ui/custom_widgets/custom_button.dart';
import 'package:calkitna_mobile_app/ui/custom_widgets/custom_text_field.dart';
import 'package:calkitna_mobile_app/ui/custom_widgets/social_auth_button.dart';
import 'package:calkitna_mobile_app/ui/screens/auth_screens/login/login_screen.dart';
import 'package:calkitna_mobile_app/ui/screens/auth_screens/signup/signup_view_model.dart';
import 'package:calkitna_mobile_app/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

import '../../../../core/enums/view_state.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupViewModel(),
      child: Consumer<SignupViewModel>(
        builder: (context, model, child) {
          return ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27.0, vertical: 95),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Text(
                        'Register..... using your email.',
                        style: headingTextStyleRoboto.copyWith(fontSize: 24.sp),
                      ),
                      SizedBox(height: 60.h),

                      ///
                      /// Text fields
                      textFields(model),
                      SizedBox(height: 40.h),

                      ///
                      /// Register button
                      CustomButton(
                        text: 'Register',
                        buttonColor: const Color(0xFF262626),
                        onTap: () {

                          model.signUpWithEmailPassword();
                        },
                        //=> Get.offAll(() => const HomeScreen()),
                        textColor: Colors.white,
                      ),
                      SizedBox(height: 24.h),
                      Center(
                        child: Text('Or continue with',
                            style: bodyTextStyleAssistant.copyWith(
                                fontSize: 14.sp, color: const Color(0xFF707070))),
                      ),
                      SizedBox(height: 25.h),

                      ///
                      /// Social login buttons
                      socailAuthButtons(model),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  textFields(SignupViewModel model) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      /// email text field
      Text(
        'Email address',
        style: bodyTextStyleRoboto.copyWith(fontSize: 14.sp),
      ),
      SizedBox(height: 8.h),
      CustomTextField(
        fillColor: const Color(0xFFEBEBEB),
        onChange: (value) {

        model.appUser.email=value;
        },
        inputType: TextInputType.emailAddress,
        disableBorder: true,
      ),
      SizedBox(height: 25.h),

      /// height
      // Text(
      //   'Height',
      //   style: bodyTextStyleRoboto.copyWith(fontSize: 14.sp),
      // ),
      // SizedBox(height: 8.h),
      // CustomTextField(
      //   fillColor: const Color(0xFFEBEBEB),
      //   onChange: (value) {},
      //   inputType: TextInputType.emailAddress,
      //   disableBorder: true,
      // ),

      // SizedBox(height: 25.h),

      /// weight field
      // Text(
      //   'Weight',
      //   style: bodyTextStyleRoboto.copyWith(fontSize: 14.sp),
      // ),
      // SizedBox(height: 8.h),
      // CustomTextField(
      //   fillColor: const Color(0xFFEBEBEB),
      //   onChange: (value) {},
      //   inputType: TextInputType.emailAddress,
      //   disableBorder: true,
      // ),

    //  SizedBox(height: 25.h),

      /// password filed

      Text(
        'Password',
        style: bodyTextStyleRoboto.copyWith(fontSize: 14.sp),
      ),
      SizedBox(height: 8.h),
      CustomTextField(
          fillColor: const Color(0xFFEBEBEB),
          onChange: (value) {
            model.appUser.password=value;
          },
          inputType: TextInputType.emailAddress,
          disableBorder: true,
          obscure: model.isShowPassword,
          suffixIcon: GestureDetector(
            onTap: () {
              model.showPassword();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset(
                model.isShowPassword
                    ? '$staticAsset/password_not_show.png'
                    : '$staticAsset/password.png',
                width: 16.28.w,
                height: 16.28.h,
                color: const Color(0xFF262626),
              ),
            ),
          )),
    ]);
  }

  socailAuthButtons(SignupViewModel model) {
    return Column(
      children: [
        Row(
          children: [
            const SocialAuthButton(
              onTap: null,
              image: '$staticAsset/google.png',
            ),
            Platform.isIOS
                ? Row(children: [
                    SizedBox(width: 10.w),
                    const SocialAuthButton(
                      onTap: null,
                      image: '$staticAsset/apple.png',
                    ),
                  ])
                : Container(),
            SizedBox(width: 10.w),
            const SocialAuthButton(
              onTap: null,
              image: '$staticAsset/facebook.png',
            ),
          ],
        ),
        SizedBox(height: 29.h),
        GestureDetector(
          onTap: () {


          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Already have an account?',
              style: bodyTextStyleAssistant.copyWith(
                  fontSize: 14.sp, color: const Color(0xFF707070)),
            ),
            SizedBox(width: 7.w),
            GestureDetector(
              onTap: (){
                Get.to(LoginScreen());
              },
              child: Text('Login',
                  style: bodyTextStyleAssistant.copyWith(
                      color: const Color(0xFF262626),
                      fontSize: 14.sp,
                      decoration: TextDecoration.underline)),
            )
          ]),
        )
      ],
    );
  }
}
