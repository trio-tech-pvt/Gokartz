import 'package:calkitna_mobile_app/core/view_models.dart/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/enums/view_state.dart';
import '../../../../core/models/custom_auth_result.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/services/database_service.dart';
import '../../../../locator.dart';
import '../../home/home_screen.dart';

class LoginViewModel extends BaseViewModel {
  bool isShowPassword = true;
  String? email;
  String? password;
  final _authService = locator<AuthService>();
  CustomAuthResult authResult = CustomAuthResult();
  //final _dbService = locator<DatabaseService>();

  void loginWithEmailAndPassword() async {
    setState(ViewState.busy);
    authResult = await _authService.loginWithEmailPassword(
        email: email, password: password);
    if (authResult.user!=null) {
      print("Artist logged in successfully");
      // await getArtClasses();
       Get.to( HomeScreen());
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