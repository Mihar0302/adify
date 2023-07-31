import 'package:adify/controller/global_controller.dart';
import 'package:adify/presentation/pages/home_screen.dart';
import 'package:adify/presentation/pages/log_in_screen.dart';
import 'package:adify/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalController global = Get.find();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      if (global.jwt.value.isNotEmpty) {
        Get.offAll(() => const HomeScreen());
      } else {
        Get.offAll(() => const LoginScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.logo,
              fit: BoxFit.contain,
              height: size.height * 0.34,
            ),
          ),
        ],
      ),
    );
  }
}
