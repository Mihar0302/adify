import 'package:adify/utils/app_color.dart';
import 'package:get/get.dart';

class AppMethods {
  static showSnack(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.TOP,
        colorText: AppColor.white,
        backgroundColor: AppColor.red);
  }
}
