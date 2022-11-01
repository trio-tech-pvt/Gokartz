import 'package:calkitna_mobile_app/core/constants/colors.dart';
import 'package:calkitna_mobile_app/core/others/screen_utils.dart';
import 'package:calkitna_mobile_app/ui/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(Get.width, Get.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return SafeArea(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MYZONE',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          ),
        );
      },
      child: const SplashScreen(),
    );

    //   ScreenUtilInit(
    //   designSize: Size(Get.width, Get.height),
    //   builder: () => GetMaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       primaryColor: primaryColor,
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: const SplashScreen(),
    //   ),
    // );
  }
}
