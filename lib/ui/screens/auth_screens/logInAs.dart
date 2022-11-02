import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/others/screen_utils.dart';
import 'login/login_screen.dart';

class LogInAs extends StatelessWidget {
  const LogInAs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: 1.sw,
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(

              "assets/static_assets/logo_gokartz.png",
              height: 230.h,
              width: 230.w,
            ),
            Image.asset(

              "assets/static_assets/manDog.png",
              height: 314.h,
              width: 304.w,
            ),SizedBox(height: 60.h,),
            GestureDetector(
              onTap: (){
                Get.to(LoginScreen());
              },
              child:
              Container(
                height: 51.h,
                width: 295.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/static_assets/customButton.png"),
                      fit: BoxFit.cover),
                ),
                child: Center(
                    child: Text(
                  "SIGN IN AS USER",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: (){},
              child: Container(
                height: 51.h,
                width: 295.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/static_assets/customButton.png"),
                      fit: BoxFit.cover),
                ),
                child: Center(child: Text("SIGN IN AS GOKARTZ",style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
