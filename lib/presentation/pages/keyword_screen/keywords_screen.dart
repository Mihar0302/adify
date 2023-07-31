// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_image.dart';
import '../../../utils/route_string.dart';
import '../google_ad_module/widgets/create_campaigns_bottom_sheet.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_report_container.dart';
import '../../widgets/custom_tab_bar.dart';
import 'active_term_widget.dart';
import 'ads_widget.dart';
import 'paused_ads_widget.dart';
import 'search_term_widget.dart';

class KeyWordsScreen extends StatefulWidget {
  const KeyWordsScreen({Key? key}) : super(key: key);

  @override
  State<KeyWordsScreen> createState() => _KeyWordsScreenState();
}

class _KeyWordsScreenState extends State<KeyWordsScreen> {
  RxInt tabIndex = 0.obs;
  RxInt screenTab = 0.obs;
  RxString tabString = "Keywords".obs;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: Column(
        children: [
          appBar(size, context),
          SizedBox(height: size.height * 0.025),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: size.width * 0.005),
                Text(
                  "Campaign",
                  style: TextStyle(
                      letterSpacing: 0.34,
                      fontWeight: FontWeight.w500,
                      fontSize: size.width * 0.036,
                      color: AppColor.grey),
                ),
                SizedBox(width: size.width * 0.025),
                Image.asset(AppImages.right,
                    height: size.height * 0.012, color: AppColor.grey),
                SizedBox(width: size.width * 0.025),
                Text(
                  "Ad groups",
                  style: TextStyle(
                      letterSpacing: 0.34,
                      color: AppColor.grey,
                      fontSize: size.width * 0.036,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(width: size.width * 0.025),
                Image.asset(AppImages.right,
                    height: size.height * 0.012, color: AppColor.grey),
                SizedBox(width: size.width * 0.025),
                Obx(
                  () => Text(
                    tabString.value,
                    style: TextStyle(
                        letterSpacing: 0.34,
                        color: AppColor.btnColor,
                        fontSize: size.width * 0.036,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.025),
          Expanded(
            child: Obx(() => tabIndex.value == 0
                ? ActiveTermWidget(size: size)
                : tabIndex.value == 1
                    ? PausedWidget(size: size)
                    : tabIndex.value == 2
                        ? Container()
                        : tabIndex.value == 4
                            ? SearchTermWidget(size: size)
                            : tabIndex.value == 5
                                ? AdsWidget(size: size)
                                : Container()),
          ),
          Obx(
            () => Container(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02,
                horizontal: size.width * 0.08,
              ),
              width: size.width,
              color: AppColor.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      tabString.value = "Keywords";
                      tabIndex.value = 0;
                    },
                    child: Text(
                      "KEYWORDS",
                      style: TextStyle(
                        letterSpacing: 0.34,
                        fontSize: size.width * 0.034,
                        color: tabIndex.value == 0
                            ? AppColor.btnColor
                            : AppColor.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      tabString.value = "Search Term";
                      tabIndex.value = 4;
                    },
                    child: Text(
                      "SEARCH TERM",
                      style: TextStyle(
                        letterSpacing: 0.34,
                        fontSize: size.width * 0.034,
                        color: tabIndex.value == 4
                            ? AppColor.btnColor
                            : AppColor.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      tabString.value = "Ads";
                      tabIndex.value = 5;
                    },
                    child: Text(
                      "ADS",
                      style: TextStyle(
                        letterSpacing: 0.34,
                        fontSize: size.width * 0.034,
                        color: tabIndex.value == 5
                            ? AppColor.btnColor
                            : AppColor.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tabBar(Size size, BuildContext context) {
    return Obx(
      () => (tabIndex.value == 4 || tabIndex.value == 5)
          ? Container()
          : CustomTabBar(
              threeTabShow: true,
              size: size,
              textOne: "ACTIVE",
              textTwo: "PAUSED",
              textThree: "NEGATIVE",
              onTapThree: () {
                Navigator.pushNamed(
                    context, RouteString.NEGATIVE_KEYWORD_SCREEN);
              },
              onTapOne: () {
                tabIndex.value = 0;
              },
              onTapTwo: () {
                tabIndex.value = 1;
              },
              tabColorOne:
                  tabIndex.value == 0 ? AppColor.btnColor : AppColor.grey,
              tabColorTwo:
                  tabIndex.value == 1 ? AppColor.btnColor : AppColor.grey,
              tabColorThree:
                  tabIndex.value == 2 ? AppColor.btnColor : AppColor.grey,
            ),
    );
  }

  Widget appBar(Size size, BuildContext context) {
    return CustomAppbar(
      size: size,
      onClick: () {
        Navigator.pop(context);
      },
      mainLabel: "ADIFY INDIA > GOOGLE KEYWORDS",
      dayCount: "7 Days",
      widgetShow: true,
      campaing: true,
      columnShow: true,
      widget: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Image.asset(AppImages.setting, height: size.height * 0.028),
          ],
        ),
      ),
    );
  }
}
