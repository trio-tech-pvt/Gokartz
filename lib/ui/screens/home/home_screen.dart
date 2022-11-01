import 'package:calkitna_mobile_app/core/constants/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/constants/colors.dart';
import '../../../core/others/screen_utils.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
             //  Get.to(ConversationScreen());
              },
              child: Container(
                height: 50.h,
                width: 200.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: blueColor
                ),
                child: Center(
                  child: Text('chat',style: headingTextStyleRoboto,),
                ),
              ),
            ),
            SizedBox(height: 20..h,),
            Container(
              height: 50.h,
              width: 200.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: blueColor
              ),
              child: Center(
                child: Text('Payment',style: headingTextStyleRoboto,),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
