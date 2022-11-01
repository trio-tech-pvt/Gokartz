import 'package:calkitna_mobile_app/core/constants/strings.dart';
import 'package:calkitna_mobile_app/core/constants/style.dart';
import 'package:calkitna_mobile_app/core/others/screen_utils.dart';
import 'package:calkitna_mobile_app/ui/custom_widgets/custom_button.dart';
import 'package:calkitna_mobile_app/ui/custom_widgets/custom_text_field.dart';
import 'package:calkitna_mobile_app/ui/custom_widgets/social_auth_button.dart';
import 'package:calkitna_mobile_app/ui/screens/auth_screens/login/login_view_model.dart';
import 'package:calkitna_mobile_app/ui/screens/auth_screens/signup/signup_screen.dart';
import 'package:calkitna_mobile_app/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

import '../../../../core/enums/view_state.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) {
          return ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27.0, vertical: 55),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// title
                      Text(
                        'Welcome Back! Please login to get access to your record. ',
                        style: headingTextStyleRoboto.copyWith(
                            fontSize: 31.sp, color: const Color(0xFF756DB8)),
                      ),
                      SizedBox(height: 40.h),

                      ///
                      /// Text fields
                      textFields(model),
                      SizedBox(height: 40.h),

                      ///
                      /// Login button
                      CustomButton(
                        text: 'Login',
                        buttonColor: const Color(0xFF756DB8),
                        onTap: () {
                        //  model.loginWithEmailAndPassword();
                          if (formKey.currentState!.validate()) {
                            model.loginWithEmailAndPassword();
                          }

                        },
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

  textFields(LoginViewModel model) {
    return Form(
     key: formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        /// email text field
        Text(
          'Email address',
          style: bodyTextStyleRoboto.copyWith(fontSize: 14.sp),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          fillColor: const Color(0xFFEBEBEB),
          onChange: (value) {
            model.email=value;
          },
          validator: (val) => val.length == 0
              ? "Please enter your email"
              : null,
          inputType: TextInputType.emailAddress,
          disableBorder: true,
        ),
        SizedBox(height: 25.h),

        /// password filed

        Text(
          'Password',
          style: bodyTextStyleRoboto.copyWith(fontSize: 14.sp),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
            fillColor: const Color(0xFFEBEBEB),
            onChange: (value) {
              model.password=value;
            },
            inputType: TextInputType.text,
            disableBorder: true,
            validator: (val) => val.length == 0
                ? "Please enter your password"
                : null,
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
                  color: const Color(0xFF756DB8),
                ),
              ),
            )),
      ]),
    );
  }

  socailAuthButtons(LoginViewModel model) {
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
          onTap: () => Get.off(() => const SignUpScreen()),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "If you don't have an account, try",
              style: bodyTextStyleAssistant.copyWith(
                  fontSize: 14.sp, color: const Color(0xFF707070)),
            ),
            SizedBox(width: 7.w),
            Text('Signing Up here.',
                style: bodyTextStyleAssistant.copyWith(
                    color: const Color(0xFF756DB8),
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline))
          ]),
        )
      ],
    );
  }
}
