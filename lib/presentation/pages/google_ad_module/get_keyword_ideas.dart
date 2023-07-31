import 'package:adify/utils/route_string.dart';
import 'package:flutter/material.dart';

import 'package:adify/presentation/widgets/custom_appbar.dart';
import 'package:adify/presentation/widgets/custom_text_feild.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';

import '../../../controller/global_controller.dart';
import 'widgets/next_buttoon_widget.dart';
import 'package:get/get.dart';

class GetKeywordIdeas extends StatefulWidget {
  const GetKeywordIdeas({super.key});

  @override
  State<GetKeywordIdeas> createState() => _GetKeywordIdeasState();
}

class _GetKeywordIdeasState extends State<GetKeywordIdeas> {
  final TextEditingController keyword = TextEditingController();
  final GlobalController globalController = Get.find();

  var selectedKeyWordList = [];
  List keywordList = [
    'h',
    'm',
    'l',
    'h',
    'm',
    'l',
    'h',
    'm',
    'l',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBAr(context, size),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  keywordIdeasField(size),
                  descriptionText(size),
                  SizedBox(height: size.height * 0.02),
                  addButton(size),
                  SizedBox(height: size.height * 0.02),
                  headerWidget(size),
                  keyWordListView(size),
                  SizedBox(height: size.height / 8),
                  NextButtonWidget(
                      title: 'Next',globalController:globalController,
                      onClick: () {
                        Navigator.pushNamed(
                            context, RouteString.CREATE_AD_PREVIEW);
                      },
                      size: size)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget keyWordListView(Size size) {
    return ListView.builder(
      itemCount: keywordList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (selectedKeyWordList.contains(index)) {
              setState(() {
                selectedKeyWordList.remove(index);
              });
            } else {
              setState(() {
                selectedKeyWordList.add(index);
              });
            }
          },
          child: Container(
            margin: EdgeInsets.only(bottom: size.height * 0.015),
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.07, vertical: size.height * 0.022),
            decoration: BoxDecoration(
                color: AppColor.white,
                border: Border.all(
                    color: selectedKeyWordList.contains(index)
                        ? AppColor.btnColor
                        : AppColor.white),
                borderRadius: BorderRadius.circular(6)),
            child: Row(
              children: [
                Text(
                  'Fancy Shoes',
                  style: TextStyle(
                    letterSpacing: 0.34,
                    fontWeight: FontWeight.w600,
                    color: selectedKeyWordList.contains(index)
                        ? AppColor.btnColor
                        : AppColor.textBlackColor,
                    fontSize: size.height * 0.019,
                  ),
                ),
                SizedBox(width: size.width * 0.08),
                Text(
                  '1489',
                  style: TextStyle(
                    letterSpacing: 0.34,
                    fontWeight: FontWeight.w600,
                    color: AppColor.textBlackColor,
                    fontSize: size.height * 0.019,
                  ),
                ),
                SizedBox(width: size.width * 0.1),
                Text(
                  '\$35.70',
                  style: TextStyle(
                    letterSpacing: 0.34,
                    fontWeight: FontWeight.w600,
                    color: AppColor.textBlackColor,
                    fontSize: size.height * 0.019,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.018,
                      vertical: size.height * 0.008),
                  decoration: BoxDecoration(
                      color: keywordList[index] == 'h'
                          ? AppColor.green
                          : keywordList[index] == 'm'
                              ? const Color(0xffFBBC05)
                              : const Color(0xffF14336),
                      borderRadius: BorderRadius.circular(6)),
                  alignment: Alignment.center,
                  child: Text(
                    keywordList[index] == 'h'
                        ? 'HIGH'
                        : keywordList[index] == 'm'
                            ? 'MEDIUM'
                            : 'LOW',
                    style: TextStyle(
                      letterSpacing: 0.34,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                      fontSize: size.height * 0.015,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget headerWidget(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
      child: Row(
        children: [
          Text(
            "Keywords",
            style: TextStyle(
              letterSpacing: 0.34,
              fontSize: size.height * 0.02,
              color: AppColor.textGreyColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: size.width * 0.09),
          Text(
            "Volume",
            style: TextStyle(
              letterSpacing: 0.34,
              fontSize: size.width * 0.034,
              color: AppColor.textGreyColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: size.width * 0.1),
          Text(
            "Avg. CPC",
            style: TextStyle(
              letterSpacing: 0.34,
              fontSize: size.width * 0.034,
              color: AppColor.textGreyColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget addButton(Size size) {
    return Center(
      child: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Icon(
                Icons.add,
                color: AppColor.btnColor,
              ),
              SizedBox(width: size.width * 0.01),
              Text(
                'Add',
                style: TextStyle(
                    letterSpacing: 0.34,
                    fontSize: size.height * 0.023,
                    color: AppColor.btnColor,
                    fontWeight: FontWeight.w500),
              )
            ],
          )),
    );
  }

  Widget descriptionText(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06, vertical: size.height * 0.015),
      child: Text(
        'Enter products or services or Enter a website to find keywords that match your site. Get volume and Avg. CPC.',
        textAlign: TextAlign.left,
        style: TextStyle(
          letterSpacing: 0.34,
          fontWeight: FontWeight.w500,
          color: AppColor.textGreyColor,
          fontSize: size.height * 0.019,
        ),
      ),
    );
  }

  Widget keywordIdeasField(Size size) {
    return CustomTextFild(
      label: "Enter Keyword Ideas ",
      margin: false,
      size: size,
      hint: "e.x. : Shoes, nike shoes etc...... ",
      controller: keyword,
    );
  }

  Widget appBAr(BuildContext context, Size size) {
    return CustomAppbar(
      mainLabel: "GET KEYWORDS IDEAS",
      columnShow: false,
      campaing: true,
      widgetShow: true,
      onClick: () {
        Navigator.pop(context);
      },
      size: size,
      widget: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Image.asset(AppImages.setting, height: size.height * 0.028),
          ),
        ],
      ),
    );
  }
}
