// ignore_for_file: unused_import, avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:adify/presentation/widgets/custom_text_feild.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:adify/models/createadcampain_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_converter/Currency.dart';
import 'package:money_converter/money_converter.dart';

import '../../../controller/add_keywords_controller.dart';
import '../../../controller/global_controller.dart';
import '../../../helper/http_helper.dart';
import '../../widgets/custom_popup.dart';
import 'create_ad_bussiness_screen.dart';
import 'widgets/next_buttoon_widget.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';

class AdsBudgetScreen extends StatefulWidget {
  final bool updates;

  const AdsBudgetScreen({super.key, required this.updates});

  @override
  State<AdsBudgetScreen> createState() => _AdsBudgetScreenState();
}

class _AdsBudgetScreenState extends State<AdsBudgetScreen> {
  final AddKeywordsController keywordsController = Get.find();

  @override
  void initState() {
    super.initState();
    keywordsController.hide.value = true;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final GlobalController globalController = Get.find();
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackColor,
      appBar: appBar(context, size),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.03),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerWidget(size),
              SizedBox(height: size.height * 0.022),
              progressWidget(size),
              SizedBox(height: size.height * 0.04),
              setBudgetLable(size),
              SizedBox(height: size.height * 0.015),
              setBudgetField(
                  keywordsController: keywordsController, size: size),
              SizedBox(height: size.height * 0.024),
              keywordsController.hide.value == true
                  ? const SizedBox()
                  : recommedation(keywordsController),
              const Spacer(),
              SizedBox(height: size.height * 0.024),
              widget.updates
                  ? Center(
                      child: UpdateBtn(
                        size: size,
                        btnName: "Save & Update",
                        onClick: () {
                          debugPrint(
                              "=====>${keywordsController.budget_id.value}");
                          if (keywordsController
                              .updateBudgetController.text.isNotEmpty) {
                            keywordsController.updateAmount(
                              budgetId:
                                  keywordsController.budget_id.value.toString(),
                              amount: int.parse(
                                keywordsController.updateBudgetController.text,
                              ),
                            );
                          } else {
                            Custompopup.showSnack("Alert", "Enter Your Budget");
                          }
                        },
                      ),
                    )
                  : Container(),
              SizedBox(height: size.height * 0.02),
              Obx(
                () => keywordsController.loading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ))
                    : Row(
                        children: [
                          SizedBox(width: size.width * 0.03),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Preview",
                              style: TextStyle(
                                color: AppColor.btnColor,
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.05),
                          Expanded(
                            child: NextButtonWidget(
                                title: widget.updates ? "Finish" : 'Publish',
                                globalController: globalController,
                                onClick: () {
                                  if (widget.updates) {
                                    Get.back();
                                    Get.back();
                                    Get.back();
                                    Get.back();
                                    Get.back();
                                  } else {
                                    if (keywordsController
                                        .updateBudgetController
                                        .text
                                        .isNotEmpty) {
                                      keywordsController.CraeateadApicall();
                                    }
                                  }
                                },
                                size: size),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget recommedation(
    AddKeywordsController keywordsController,
  ) {
    return ListView.builder(
      itemCount: keywordsController.suggestibudgetlist.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: InkWell(
            onTap: () {
              keywordsController.updateBudgetController.text =
                  (keywordsController.suggestibudgetlist[index]['micros'] /
                          1000000)
                      .toInt()
                      .toString();
              debugPrint(
                  "=====> = = = = = ==  >  > > > ${keywordsController.suggestibudgetlist}");
              keywordsController.selectcpc.value = index;
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                border: Border.all(
                    color: keywordsController.selectcpc.value == index
                        ? Colors.blue
                        : Colors.transparent),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                      "₹ ${(keywordsController.suggestibudgetlist[index]['micros'] / 1000000).toInt().toString()}"),
                  const Spacer(),
                  Text(
                    keywordsController.budgetSug[index],
                    style: TextStyle(
                      fontWeight:
                          keywordsController.budgetSug[index] == "recommended"
                              ? FontWeight.bold
                              : FontWeight.w400,
                      color:
                          keywordsController.budgetSug[index] == "recommended"
                              ? AppColor.btnColor
                              : AppColor.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget savaDraftBtn(Size size) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'Save as draft',
          style: TextStyle(
            letterSpacing: 0.34,
            fontWeight: FontWeight.w600,
            color: AppColor.btnColor,
            fontSize: size.height * 0.024,
          ),
        ),
      ),
    );
  }

  Widget setCpcTarget(Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: size.width * 0.17),
        Icon(Icons.circle,
            color: const Color(0xffD9D9D9), size: size.height * 0.02),
        SizedBox(width: size.width * 0.024),
        Text(
          'Set a target CPC',
          style: TextStyle(
              letterSpacing: 0.34,
              color: AppColor.textGreyColor,
              fontSize: size.height * 0.018,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget setBudgetField(
      {required Size size, required AddKeywordsController keywordsController}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.height * 0.01),
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: size.width * 0.3,
              height: size.height * 0.06,
              child: CustomTextFild2(
                inputType: TextInputType.number,
                keyboardType: TextInputType.number,
                max: false,
                whit: false,
                size: size,
                hint: '₹',
                controller: keywordsController.updateBudgetController,
                textStyle: TextStyle(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.01,
          ),
          Text(
            "per day",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: size.width * 0.04),
          ),
          SizedBox(
            width: size.width * 0.03,
          ),
          // badgetPerDay(size),
          budgetRecommButton(
              keywordsController: keywordsController, size: size),
        ],
      ),
    );
  }

  Widget budgetRecommButton(
      {required Size size, required AddKeywordsController keywordsController}) {
    return GestureDetector(
      onTap: () {
        keywordsController.hide.value = !keywordsController.hide.value;
        print(keywordsController.hide.value);
      },
      child: Text(
        keywordsController.hide.value == true ? "Recommendation" : "Hide",
        style: TextStyle(
            letterSpacing: 0.34,
            fontWeight: FontWeight.w600,
            fontSize: size.height * 0.017,
            color: AppColor.btnColor),
      ),
    );
  }

  Widget badgetPerDay(Size size) {
    return RichText(
      text: TextSpan(
        text: '₹ ${keywordsController.maxcpc.value}',
        style: TextStyle(
            letterSpacing: 0.34,
            fontWeight: FontWeight.w600,
            fontSize: size.height * 0.020,
            color: AppColor.textBlackColor),
        children: [
          TextSpan(
            text: ' / Per day',
            style: TextStyle(
                letterSpacing: 0.34,
                fontWeight: FontWeight.w600,
                fontSize: size.height * 0.019,
                color: AppColor.textGreyColor),
          ),
        ],
      ),
    );
  }

  Widget setBudgetLable(Size size) {
    return Text(
      'Set your budget',
      style: TextStyle(
          letterSpacing: 0.34,
          color: AppColor.textGreyColor,
          fontSize: size.height * 0.02,
          fontWeight: FontWeight.w600),
    );
  }

  appBar(BuildContext context, Size size) {
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
              top: size.height * 0.023,
              bottom: size.height * 0.023,
              left: size.width * 0.04,
              right: size.width * 0.04),
          child: InkWell(
            onTap: () {},
            child: Image.asset(AppImages.bell, height: size.height * 0.028),
          ),
        ),
      ],
    );
  }

  Widget progressWidget(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: size.height * 0.013,
          width: size.width / 4.8,
          decoration: BoxDecoration(
              color: AppColor.btnColor,
              borderRadius: BorderRadius.circular(50)),
        ),
        Container(
          height: size.height * 0.013,
          width: size.width / 4.8,
          decoration: BoxDecoration(
              color: AppColor.btnColor,
              borderRadius: BorderRadius.circular(50)),
        ),
        Container(
          height: size.height * 0.013,
          width: size.width / 4.8,
          decoration: BoxDecoration(
              color: AppColor.btnColor,
              borderRadius: BorderRadius.circular(50)),
        ),
        Container(
          height: size.height * 0.013,
          width: size.width / 4.8,
          decoration: BoxDecoration(
              color: AppColor.black, borderRadius: BorderRadius.circular(50)),
        )
      ],
    );
  }

  Widget headerWidget(Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Business",
          style: TextStyle(
            letterSpacing: 0.34,
            fontWeight: FontWeight.w600,
            fontSize: size.width * 0.036,
            color: AppColor.btnColor,
          ),
        ),
        SizedBox(width: size.width * 0.012),
        slashWidget(size),
        SizedBox(width: size.width * 0.009),
        Text(
          "Location",
          style: TextStyle(
            letterSpacing: 0.34,
            color: AppColor.btnColor,
            fontSize: size.width * 0.036,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: size.width * 0.012),
        slashWidget(size),
        SizedBox(width: size.width * 0.009),
        Text(
          "Preview",
          style: TextStyle(
            letterSpacing: 0.34,
            color: AppColor.btnColor,
            fontSize: size.width * 0.036,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: size.width * 0.012),
        slashWidget(size),
        SizedBox(width: size.width * 0.009),
        Text(
          'Budget',
          style: TextStyle(
            letterSpacing: 0.34,
            color: AppColor.black,
            fontSize: size.width * 0.036,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget slashWidget(Size size) {
    return Text(
      "/",
      style: TextStyle(
        letterSpacing: 0.34,
        color: AppColor.textGreyColor,
        fontSize: size.width * 0.036,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget updateBudget(Size size, TextEditingController textEditingController) {
    return Container(
      alignment: Alignment.center,
      width: size.width,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.03,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.secondaryColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 10,
            )
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: CustomTextFild2(
              size: size,
              hint: "₹ 500",
              controller: textEditingController,
              inputType: TextInputType.number,
              keyboardType: TextInputType.number,
              textStyle: const TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(width: size.width * 0.01),
          Text(
            "Per day",
            style: TextStyle(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
