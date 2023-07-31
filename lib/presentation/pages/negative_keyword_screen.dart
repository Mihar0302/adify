import 'package:adify/presentation/widgets/custom_appbar.dart';
import 'package:adify/presentation/widgets/custom_btn.dart';
import 'package:adify/presentation/widgets/custom_text_feild.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/add_new_keyword_model.dart';

class NegativeKeywordScreen extends StatefulWidget {
  const NegativeKeywordScreen({Key? key}) : super(key: key);

  @override
  State<NegativeKeywordScreen> createState() => _NegativeKeywordScreenState();
}

class _NegativeKeywordScreenState extends State<NegativeKeywordScreen> {
  TextEditingController keyword = TextEditingController();
  TextEditingController cpc = TextEditingController();
  RxString type = "".obs;
  List<AddNewKeywordModel> keywordData = [
    AddNewKeywordModel(
        keyword: "Facebook ads", type: "Brand", maxCpc: "10", status: ''),
    AddNewKeywordModel(
        keyword: "Facebook ads", type: "Brand", maxCpc: "10", status: ''),
    AddNewKeywordModel(
        keyword: "Facebook ads", type: "Brand", maxCpc: "10", status: ''),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: Column(
        children: [
          CustomAppbar(
            mainLabel: "NEGATIVE KEYWORDS",
            campaing: true,
            widget: Image.asset(AppImages.editing, height: size.height * 0.028),
            widgetShow: true,
            size: size,
            onClick: () {
              Navigator.pop(context);
            },
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.02),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: keywordData.length,
                  itemBuilder: (context, int i) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.05,
                      ),
                      child: Row(
                        children: [
                          Text(
                            keywordData[i].keyword,
                            style: TextStyle(
                              letterSpacing: 0.34,
                              color: AppColor.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * 0.039,
                            ),
                          ),
                          Expanded(child: Container()),
                          InkWell(
                            onTap: () {
                              keywordData.removeAt(i);
                              setState(() {});
                            },
                            child: Text(
                              "Remove",
                              style: TextStyle(
                                letterSpacing: 0.34,
                                color: AppColor.btnColor,
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.037,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          CustomBtn(
              size: size,
              iconShow: false,
              btnName: "Add negative keyword",
              onClick: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                    ),
                    backgroundColor: AppColor.secondaryColor,
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: size.height * 0.025),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.07),
                              child: Row(
                                children: [
                                  Text(
                                    "Negative Keywords",
                                    style: TextStyle(
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
                            // SizedBox(height: size.height * 0.03),
                            CustomTextFild(
                              label: "",
                              margin: true,
                              size: size,
                              hint: "Text here",
                              controller: keyword,
                            ),
                            SizedBox(height: size.height * 0.03),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.065,
                                  bottom: size.height * 0.011),
                              child: Text(
                                "Select type of match",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.grey,
                                  fontSize: size.width * 0.034,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.06),
                              child: Obx(
                                () => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          "Brand",
                                          style: TextStyle(
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          "Pharse",
                                          style: TextStyle(
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          "Exact",
                                          style: TextStyle(
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
                            SizedBox(height: size.height * 0.06),
                            CustomBtn(
                                size: size,
                                iconShow: false,
                                btnName: "Add Negative Keyword",
                                onClick: () {
                                  if (keyword.text.isNotEmpty &&
                                      type.value.isNotEmpty &&
                                      cpc.text.isNotEmpty) {
                                    AddNewKeywordModel added =
                                        AddNewKeywordModel(
                                            keyword: keyword.text,
                                            type: type.value,
                                            maxCpc: cpc.text,
                                            status: 'h');
                                    keywordData.add(added);
                                    setState(() {});
                                    Navigator.pop(context);
                                  } else {}
                                }),
                            SizedBox(height: size.height * 0.02),
                          ],
                        ),
                      );
                    });
              }),
          SizedBox(height: size.height * 0.02),
        ],
      ),
    );
  }
}
