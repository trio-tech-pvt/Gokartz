import 'package:calkitna_mobile_app/core/constants/colors.dart';
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
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) {
          return ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            child: Scaffold(
                backgroundColor: whiteColor,
                body: SingleChildScrollView(
                  child: Container(
                    height: 1.sh,
                    width: 1.sw,
                    // color: Colors.red,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/static_assets/mainGift.png',
                                  height: 421.h,
                                  width: 233.w,
                                ),
                                Image.asset(
                                  "assets/static_assets/small_logo.png",
                                  height: 270.h,
                                  width: 150.w,
                                ),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 130.w),
                              child: Image.asset(
                                "assets/static_assets/background_image.png",
                                height: 300.h,
                                width: 400.w,
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 40.h),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 480.h,
                                width: 335.w,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.7),
                                      blurRadius: 4,
                                      spreadRadius: 1,
                                      offset: const Offset(1, 2),
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.r)),
                                  color: whitecolor,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 25.h),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'SIGN IN',
                                              textAlign: TextAlign.start,
                                              style: kTextStylenunito.copyWith(fontWeight: FontWeight.w700,fontSize: 22.sp),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 22.h,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 51.h,
                                              width: 295.w,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Email',
                                                  hintStyle: bodyTextStyleRoboto.copyWith(color: blackColor.withOpacity(.19)
                                                  ),
                                                  prefixIcon:
                                                      Icon(Icons.mail_outlined,color:blackColor.withOpacity(.19) ,),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Container(
                                              height: 51.h,
                                              width: 295.w,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: TextFormField(
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Password',
                                                  hintStyle: bodyTextStyleRoboto.copyWith(color: blackColor.withOpacity(.19)
                                                  ),
                                                  prefixIcon:
                                                      Icon(Icons.lock_outline,color:blackColor.withOpacity(.19)),
                                                  suffixIcon: Icon(
                                                      Icons.visibility_off,color: blackColor.withOpacity(.19),),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 22.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                Row(
                                                  children: [
                                                    Theme(
                                                      data: Theme.of(context).copyWith(
                                                        unselectedWidgetColor: blackColor.withOpacity(.20),
                                                      ),
                                                      child: Checkbox(
                                                      //  activeColor: Colors.red,
                                                        checkColor: Colors.white,
                                                        // fillColor: MaterialStateProperty.resolveWith(),
                                                        value: false,
                                                        shape: CircleBorder(),
                                                        onChanged: (bool? value) {
                                                          // setState(() {
                                                          //  // isChecked = value!;
                                                          // });
                                                        },
                                                      ),
                                                    ),
                                                    Text(
                                                      'Remember Me',
                                                      style: bodyTextStyleRoboto
                                                          .copyWith(
                                                        fontSize: 12.sp,
                                                          color:blackColor.withOpacity(.30)
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                  Text('Forgot password ?',style: bodyTextStyleRoboto
                                                      .copyWith(
                                                    fontSize: 12.sp,
                                                    color:blackColor.withOpacity(.30)
                                                  ),)
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 35.h,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(LoginScreen());
                                              },
                                              child: Container(
                                                height: 51.h,
                                                width: 295.w,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/static_assets/customButton.png"),
                                                      fit: BoxFit.cover),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "SIGN IN ",
                                                    style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 35.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/static_assets/line.png",
                                                  width: 60.w,
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Text('or Continue with',style: bodyTextStyleRoboto
                                                    .copyWith(
                                                    fontSize: 13.sp,
                                                    color:blackColor.withOpacity(.30)
                                                ),),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Image.asset(
                                                  "assets/static_assets/line.png",
                                                  width: 60.w,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 22.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Image.asset(
                                                    "assets/static_assets/facebook.png",
                                                    height: 33.h,
                                                    width: 91.w,
                                                  ),
                                                  Image.asset(
                                                    "assets/static_assets/google.png",
                                                    height: 33.h,
                                                    width: 91.w,
                                                  ),
                                                  Image.asset(
                                                    "assets/static_assets/twitter.png",
                                                    height: 33.h,
                                                    width: 91.w,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 24.h,
                                            ),
                                            Image.asset(
                                              "assets/static_assets/singup.png",
                                              height: 14.h,
                                              width: 141.w,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
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
        // Text(
        //   'Email address',
        //   style: bodyTextStyleRoboto.copyWith(fontSize: 14.sp),
        // ),
        SizedBox(height: 8.h),
        CustomTextField(
          fillColor: const Color(0xFFEBEBEB),
          hintText: 'Email',
          prefixIcon: Icon(Icons.mail_outlined),
          // prefixIcon: Icon(Icons.mail_outlined,size: 20,),
          onChange: (value) {
            model.email = value;
          },
          validator: (val) =>
              val.length == 0 ? "Please enter your email" : null,
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
            hintText: 'password',
            prefixIcon: Icon(Icons.lock_outline),
            onChange: (value) {
              model.password = value;
            },
            inputType: TextInputType.text,
            disableBorder: true,
            validator: (val) =>
                val.length == 0 ? "Please enter your password" : null,
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
