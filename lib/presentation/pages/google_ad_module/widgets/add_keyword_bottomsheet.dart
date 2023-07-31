import 'package:adify/controller/add_keywords_controller.dart';
import 'package:flutter/material.dart';

import 'package:adify/presentation/widgets/custom_btn.dart';
import 'package:adify/presentation/widgets/custom_text_feild.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';


class AddKeywordBottomSheet extends StatelessWidget {
  final Size size;
  final TextEditingController keywordCtrl;
  final String type;
  final AddKeywordsController addKeywordsController;
  final int tab;
  final Function onTap1;
  final Function onTap2;
  final Function onTap3;
  final Function onCLick;

  const AddKeywordBottomSheet({
    Key? key,
    required this.size,
    required this.addKeywordsController,
    required this.keywordCtrl,
    required this.type,
    required this.onTap1,
    required this.onTap2,
    required this.tab,
    required this.onTap3,
    required this.onCLick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: size.height * 0.04),
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.07,
                  right: size.width * 0.07,
                ),
                child: Row(
                  children: [
                    addKeyWordLable(),
                    Expanded(child: Container()),
                    closeBtn(context),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.045),
              searchTermField(),
              SizedBox(height: size.height * 0.043),
              selectTypeLable(),
              selectTypeTabBar(),
              SizedBox(height: size.height * 0.043),
              SizedBox(height: size.height * 0.025),
              addKeyWordBtn(setState, context),
              SizedBox(height: size.height * 0.02),
            ],
          ),
        ),
      );
    });
  }

  Widget addBulkKeywordsButton() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Add bulk keywords',
          style: TextStyle(
            letterSpacing: 0.34,
            fontWeight: FontWeight.w600,
            color: AppColor.btnColor,
            fontSize: size.height * 0.026,
          ),
        ),
      ),
    );
  }

  Widget addKeyWordLable() {
    return Text(
      "ADD KEYWORDS",
      style: TextStyle(
        letterSpacing: 0.34,
        fontSize: size.width * 0.045,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget closeBtn(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(
        AppImages.close,
        height: size.height * 0.04,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget searchTermField() {
    return CustomTextFild(
      label: "Search Term",
      margin: true,
      size: size,
      hint: "Text here",
      controller: keywordCtrl,
    );
  }

  Widget selectTypeLable() {
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * 0.065, bottom: size.height * 0.018),
      child: Text(
        "Select type of match",
        style: TextStyle(
          letterSpacing: 0.34,
          fontWeight: FontWeight.w500,
          color: AppColor.textGreyColor,
          fontSize: size.width * 0.034,
        ),
      ),
    );
  }

  Widget selectTypeTabBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              onTap1();
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.015,
                horizontal: size.width * 0.07,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: type == "BROAD"
                        ? AppColor.btnColor
                        : AppColor.secondaryColor),
                color:
                    type == "BROAD" ? AppColor.secondaryColor : AppColor.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "BROAD",
                style: TextStyle(
                  letterSpacing: 0.34,
                  fontSize: size.width * 0.037,
                  fontWeight: FontWeight.w500,
                  color: type == "BROAD"
                      ? AppColor.btnColor
                      : AppColor.textBlackColor,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onTap2();
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.015,
                horizontal: size.width * 0.07,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: type == "PHRASE"
                        ? AppColor.btnColor
                        : AppColor.secondaryColor),
                color:
                    type == "PHRASE" ? AppColor.secondaryColor : AppColor.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "PHRASE",
                style: TextStyle(
                  letterSpacing: 0.34,
                  fontSize: size.width * 0.037,
                  fontWeight: FontWeight.w500,
                  color: type == "PHRASE"
                      ? AppColor.btnColor
                      : AppColor.textBlackColor,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onTap3();
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.015,
                horizontal: size.width * 0.07,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: type == "EXACT"
                        ? AppColor.btnColor
                        : AppColor.secondaryColor),
                color:
                    type == "EXACT" ? AppColor.secondaryColor : AppColor.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "EXACT",
                style: TextStyle(
                  letterSpacing: 0.34,
                  fontSize: size.width * 0.037,
                  fontWeight: FontWeight.w500,
                  color: type == "EAXCT"
                      ? AppColor.btnColor
                      : AppColor.textBlackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addKeyWordBtn(StateSetter setState, BuildContext context) {
    return CustomBtn(
        size: size,
        iconShow: false,
        btnName: "Add Keyword",
        onClick: () {
          onCLick();
        });
  }
}
