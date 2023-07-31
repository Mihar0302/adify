// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:adify/controller/add_keywords_controller.dart';
import 'package:adify/presentation/pages/billing_module/payment_screen.dart';
import 'package:adify/presentation/widgets/custom_btn.dart';
import 'package:adify/presentation/widgets/custom_text_feild.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:adify/utils/route_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingScreen extends StatelessWidget {
  const BillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final AddKeywordsController addKeywordsController = Get.find();
    final _formkey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(context, size),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.045, vertical: size.height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Budget',
                    style: TextStyle(
                        letterSpacing: 0.34,
                        color: AppColor.textBlackColor,
                        fontSize: size.height * 0.032,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: size.height * 0.015),
                  CustomTextFild(
                      size: size,
                      numberKeyboard: true,
                      validator: (value) {
                        return null;
                      },
                      label: "How much budget do you want to add?",
                      hint: "Rs.",
                      controller: addKeywordsController.addbidget),
                  SizedBox(height: size.height * 0.015),
                  Container(
                    width: size.width,
                    padding:
                        EdgeInsets.symmetric(vertical: size.height * 0.031),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      children: [
                        Text(
                          '\$785.50',
                          style: TextStyle(
                              letterSpacing: 0.34,
                              color: AppColor.btnColor,
                              fontSize: size.height * 0.033,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 0.002 * size.height),
                        Text(
                          'Totat amount',
                          style: TextStyle(
                              letterSpacing: 0.34,
                              color: const Color(0xFF1A1A1A),
                              fontSize: size.height * 0.033,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 0.02 * size.height),
                        SizedBox(
                          width: size.width / 1.58,
                          child: CustomBtn(
                            size: size,
                            iconShow: false,
                            onClick: () async {
                              // await addKeywordsController.getBalanceApicall();
                              // await addKeywordsController.getTransictionApicall();
                              Get.to(const PaymentScreen());
                            },
                            btnName: 'Make a Payment',
                          ),
                        ),
                        SizedBox(height: 0.012 * size.height),
                        Text(
                          'Your last transaction was 25th january, 2022',
                          style: TextStyle(
                              color: const Color(0xFF707070),
                              fontSize: size.height * 0.016,
                              letterSpacing: 0.34,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.032 * size.height),
                  Text(
                    'Last transaction',
                    style: TextStyle(
                        letterSpacing: 0.34,
                        color: const Color(0xFF707070),
                        fontSize: size.height * 0.022,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 0.014 * size.height),
                  Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.028,
                        horizontal: size.width * 0.05),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: EdgeInsets.only(
                                    bottom:
                                        index == 2 ? 0.0 : size.height * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '1st jan - 28 jan',
                                      style: TextStyle(
                                          letterSpacing: 0.34,
                                          color: AppColor.textGreyColor,
                                          fontSize: size.height * 0.018,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      '\$254.00',
                                      style: TextStyle(
                                          letterSpacing: 0.34,
                                          color: AppColor.textGreyColor,
                                          fontSize: size.height * 0.018,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              )),
                    ),
                  ),
                  SizedBox(height: 0.032 * size.height),
                  Text(
                    'Add payment method',
                    style: TextStyle(
                        letterSpacing: 0.34,
                        color: const Color(0xFF707070),
                        fontSize: size.height * 0.022,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 0.014 * size.height),
                  Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.06,
                        horizontal: size.width * 0.2),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.021,
                            horizontal: size.width * 0.05),
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            border: Border.all(color: AppColor.btnColor),
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          'Add payment',
                          style: TextStyle(
                              letterSpacing: 0.3,
                              color: AppColor.btnColor,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context, Size size) {
    return AppBar(
      centerTitle: true,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.04, right: size.width * 0.04),
          child: Image.asset(
            AppImages.arrowRight,
            height: size.height * 0.031,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
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
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: AppColor.white,
      actions: [
        Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.026,
              bottom: size.height * 0.026,
              left: size.width * 0.04,
              right: size.width * 0.04),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteString.EDIT_ADS);
            },
            child: Image.asset(AppImages.editing),
          ),
        ),
      ],
    );
  }
}
