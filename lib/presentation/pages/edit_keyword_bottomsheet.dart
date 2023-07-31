// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import, must_be_immutable
import 'package:adify/presentation/widgets/custom_text_feild.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:adify/models/add_new_keyword_model.dart';
import 'package:adify/presentation/widgets/custom_btn.dart';

class EditKeywordWidget extends StatelessWidget {
  EditKeywordWidget({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;

  TextEditingController keyword = TextEditingController();
  TextEditingController cpc = TextEditingController();
  RxString type = "".obs;
  List<AddNewKeywordModel> keywordData = [
    AddNewKeywordModel(
        keyword: "Facebook ads", type: "Brand", maxCpc: "10", status: 'm'),
    AddNewKeywordModel(
        keyword: "Facebook ads", type: "Brand", maxCpc: "10", status: 'l'),
    AddNewKeywordModel(
        keyword: "Facebook ads", type: "Brand", maxCpc: "10", status: 'h'),
  ];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: size.height * 0.025),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
              child: Row(
                children: [
                  Text(
                    "EDIT ADS",
                    style: TextStyle(
                      letterSpacing: 0.34,
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      AppImages.close,
                      height: size.height * 0.04,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            CustomTextFild(
              label: "Serach Term",
              margin: true,
              size: size,
              hint: "Text here",
              controller: keyword,
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.065, bottom: size.height * 0.011),
              child: Text(
                "Select type of match",
                style: TextStyle(
                  letterSpacing: 0.34,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textGreyColor,
                  fontSize: size.width * 0.034,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        type.value = "Brand";
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.015,
                          horizontal: size.width * 0.07,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: type.value == "Brand"
                                  ? AppColor.btnColor
                                  : AppColor.secondaryColor),
                          color: type.value == "Brand"
                              ? AppColor.secondaryColor
                              : AppColor.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Brand",
                          style: TextStyle(
                            letterSpacing: 0.34,
                            fontSize: size.width * 0.037,
                            fontWeight: FontWeight.w500,
                            color: type.value == "Brand"
                                ? AppColor.btnColor
                                : AppColor.black,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        type.value = "Pharse";
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.015,
                          horizontal: size.width * 0.07,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: type.value == "Pharse"
                                  ? AppColor.btnColor
                                  : AppColor.secondaryColor),
                          color: type.value == "Pharse"
                              ? AppColor.secondaryColor
                              : AppColor.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Ph",
                          style: TextStyle(
                            letterSpacing: 0.34,
                            fontSize: size.width * 0.037,
                            fontWeight: FontWeight.w500,
                            color: type.value == "Pharse"
                                ? AppColor.btnColor
                                : AppColor.black,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        type.value = "Exact";
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.015,
                          horizontal: size.width * 0.07,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: type.value == "Exact"
                                  ? AppColor.btnColor
                                  : AppColor.secondaryColor),
                          color: type.value == "Exact"
                              ? AppColor.secondaryColor
                              : AppColor.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "Exact",
                          style: TextStyle(
                            letterSpacing: 0.34,
                            fontSize: size.width * 0.037,
                            fontWeight: FontWeight.w500,
                            color: type.value == "Exact"
                                ? AppColor.btnColor
                                : AppColor.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            CustomTextFild(
              label: "Max CPC",
              margin: true,
              size: size,
              hint: "Text here",
              controller: cpc,
            ),
            SizedBox(height: size.height * 0.06),
            // CustomBtn(
            //     size: size,
            //     iconShow: false,
            //     btnName: "Add Keyword",
            //     onClick: () {
            //       if (keyword.text.isNotEmpty &&
            //           type.value.isNotEmpty &&
            //           cpc.text.isNotEmpty) {
            //         AddNewKeywordModel added = AddNewKeywordModel(
            //             keyword: keyword.text,
            //             type: type.value,
            //             maxCpc: cpc.text,
            //             status: 'h');
            //         keywordData.add(added);
            //         setState(() {});
            //         Navigator.pop(context);
            //       } else {}
            //     }),
            SizedBox(height: size.height * 0.02),
          ],
        ),
      );
    });
  }
}
