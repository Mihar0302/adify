// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:adify/helper/http_helper.dart';
// ignore: unused_import
import 'package:adify/models/keywords_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/shared_pref_helper.dart';
import '../models/login_model.dart';

class GlobalController extends GetxController {
  RxInt tabIndex = 0.obs;
  RxInt locationTabIndex = 0.obs;
  RxBool showDropDown = false.obs;
  RxString idToken = "".obs;
  RxString accessToken = "".obs;
  RxString jwt = "".obs;
  RxString username = "".obs;

  var showlocation;
  List<Placemark> placemarks = [];

  void locationSelectTab(int index) {
    locationTabIndex.value = index;
    update();
  }

  void activeDropDownFun() {
    showDropDown.value = !showDropDown.value;
    update();
  }

  List<JwtTokenGet> jwtList = [];
  RxBool loginLoading = false.obs;

  loginApiCall({required Function onTap}) async {
    loginLoading.value = true;
    final SharedPreferencesHelper prefs = SharedPreferencesHelper(
      pref: await SharedPreferences.getInstance(),
    );
    LoginModel loginModel = LoginModel(
      idToken: idToken.value,
      accessToken: accessToken.value,
    );
    JwtTokenGet? data = await HttpHelper.googleLoginApi(loginModel.toJson());
    if (data != null) {
      jwtList.add(data);
      debugPrint("==> ${jwtList[0].token}");
      await prefs.setjWT(jwtList[0].token);
      jwt.value = jwtList[0].token;
      onTap();
    }
    loginLoading.value = false;
  }
}
