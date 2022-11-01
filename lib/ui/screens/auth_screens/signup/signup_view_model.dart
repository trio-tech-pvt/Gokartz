import 'package:calkitna_mobile_app/core/models/app_user.dart';
import 'package:calkitna_mobile_app/core/services/auth_service.dart';
import 'package:calkitna_mobile_app/core/services/database_service.dart';
import 'package:calkitna_mobile_app/core/view_models.dart/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/enums/view_state.dart';
import '../../../../core/models/custom_auth_result.dart';
import '../../../../locator.dart';
import '../login/login_screen.dart';

class SignupViewModel extends BaseViewModel {
  String? email;
  String? password;
  bool isShowPassword = true;
  AppUser appUser = AppUser();
  final _authService = locator<AuthService>();
  final _dbService = locator<DatabaseService>();
  CustomAuthResult authResult = CustomAuthResult();

  void signUpWithEmailPassword() async {
    setState(ViewState.busy);
    authResult = await _authService.signUpWithEmailPassword(appUser);
    if (authResult.user!=null) {
      print("Artist logged in successfully");
      // await getArtClasses();

      Get.to(() =>  LoginScreen());
      //Get.offAll(() => ArtistBottomnavigation());
    } else {
      Get.dialog(AlertDialog(
        title: Text("Error"),
        content: Text("${authResult.errorMessage}"),
        actions: [
          ElevatedButton(child: Text("Ok"), onPressed: () => Get.back())
        ],
      ));
    }
    setState(ViewState.idle);
  }

  showPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }
}
