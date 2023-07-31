import 'package:adify/controller/add_keywords_controller.dart';
import 'package:adify/controller/global_controller.dart';
import 'package:adify/domain/auth_services.dart';
import 'package:adify/presentation/pages/home_screen.dart';
import 'package:adify/presentation/widgets/custom_btn.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalController globalController = Get.put(GlobalController());
  final AddKeywordsController keywordsController =
      Get.put(AddKeywordsController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: Obx(
        () => globalController.loginLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImages.speaker,
                          fit: BoxFit.contain,
                          height: size.height * 0.035,
                        ),
                        Text(
                          "ADIFY",
                          style: TextStyle(
                            letterSpacing: 0.34,
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.05,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.015),
                    Center(
                      child: Image.asset(
                        AppImages.loginLogo,
                        height: size.height * 0.6,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Text(
                        "Google ads can increase your revenuve upto 5x.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 0.34,
                          fontSize: size.width * 0.051,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    SizedBox(
                      width: size.width * 0.65,
                      child: Text(
                        "Let's create high performing google ad in just 4 steps...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 0.34,
                          fontSize: size.width * 0.039,
                          color: AppColor.grey,
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    CustomBtn(
                      size: size,
                      btnName: "SignIn with Google",
                      iconShow: true,
                      onClick: () {
                        // Get.off(
                        //   () => const HomeScreen(),
                        // );
                        AuthService().signInWithGoogle().then((value) {
                          if (FirebaseAuth.instance.currentUser != null) {
                            globalController.loginApiCall(onTap: () {
                              Get.off(
                                () => const HomeScreen(),
                              );
                            });
                          }
                        });
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                  ],
                ),
              ),
      ),
    );
  }
}
