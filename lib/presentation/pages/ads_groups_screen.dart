// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/add_keywords_controller.dart';
import '../../controller/global_controller.dart';
import '../../utils/app_color.dart';
import '../../utils/app_image.dart';
import '../../utils/route_string.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_empty.dart';
import '../widgets/custom_report_container.dart';
import '../widgets/custom_tab_bar.dart';

class AdsGroupsScreen extends StatefulWidget {
  const AdsGroupsScreen({Key? key}) : super(key: key);

  @override
  State<AdsGroupsScreen> createState() => _AdsGroupsScreenState();
}

class _AdsGroupsScreenState extends State<AdsGroupsScreen> {
  RxInt tabIndex = 0.obs;
  final AddKeywordsController keywordsController = Get.find();
  GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppbar(
            size: size,
            onClick: () {
              globalController.tabIndex.value = 0;
            },
            mainLabel: "Keywords",
            widgetShow: false,
            campaing: true,
            columnShow: false,
            widget: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Image.asset(AppImages.serach, height: size.height * 0.028),
                  SizedBox(width: size.width * 0.03),
                  Image.asset(AppImages.setting, height: size.height * 0.028),
                ],
              ),
            ),
          ),
          // Obx(
          //   () => CustomTabBar(
          //     size: size,
          //     textOne: "ACTIVE",
          //     textTwo: "PAUSED",
          //     onTapOne: () {
          //       tabIndex.value = 0;
          //     },
          //     onTapTwo: () {
          //       tabIndex.value = 1;
          //     },
          //     tabColorOne:
          //         tabIndex.value == 0 ? AppColor.btnColor : AppColor.grey,
          //     tabColorTwo:
          //         tabIndex.value == 1 ? AppColor.btnColor : AppColor.grey,
          //   ),
          // ),
          SizedBox(height: size.height * 0.025),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Row(
              children: [
                SizedBox(width: size.width * 0.005),
                Text(
                  "Campaign",
                  style: TextStyle(
                    letterSpacing: 0.34,
                    fontWeight: FontWeight.w500,
                    fontSize: size.width * 0.04,
                    color: AppColor.grey,
                  ),
                ),
                SizedBox(width: size.width * 0.04),
                Image.asset(
                  AppImages.right,
                  height: size.height * 0.014,
                  color: AppColor.grey,
                ),
                SizedBox(width: size.width * 0.04),
                Text(
                  "Keywords",
                  style: TextStyle(
                    letterSpacing: 0.34,
                    color: AppColor.btnColor,
                    fontSize: size.width * 0.036,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: size.height * 0.025),
          Obx(
            () => tabIndex.value == 0
                ? keywordsController.keywordmetrixlist.isEmpty
                    ? Center(
                        child: CustomEmpty(size: size),
                      )
                    : Column(
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount:
                                keywordsController.keywordmetrixlist.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, int i) {
                              return CustomReportContainer(
                                size: size,
                                firstText: keywordsController
                                    .keywordmetrixlist[i]['clicks']
                                    .toString(),
                                secondText: keywordsController
                                    .keywordmetrixlist[i]['impressions']
                                    .toString(),
                                threeText: keywordsController
                                    .keywordmetrixlist[i]['ctr']
                                    .toString(),
                                fourText: keywordsController
                                    .keywordmetrixlist[i]['average_cpc']
                                    .toString(),
                                widget: Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.63,
                                      child: Text(
                                        keywordsController.keywordmetrixlist[i]
                                            ['keyword_text'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          letterSpacing: 0.34,
                                          fontWeight: FontWeight.w500,
                                          fontSize: size.width * 0.042,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                onClick: () {
                                  // Navigator.pushNamed(
                                  //     context, RouteString.KEY_WORDS_SCREEN);
                                },
                              );
                            },
                          )
                        ],
                      )
                : tabIndex.value == 1
                    ? Column(
                        children: [
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 3,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, int i) {
                              return CustomReportContainer(
                                size: size,
                                firstText: "23",
                                secondText: "23",
                                threeText: "23",
                                fourText: "23",
                                widget: Row(
                                  children: [
                                    Text(
                                      "Google Keywords",
                                      style: TextStyle(
                                        letterSpacing: 0.34,
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.width * 0.042,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: size.height * 0.0027,
                                        horizontal: size.width * 0.02,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColor.ambr.withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "PAUSED",
                                            style: TextStyle(
                                              letterSpacing: 0.34,
                                              color: AppColor.ambr,
                                              fontSize: size.width * 0.033,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                onClick: () {
                                  Navigator.pushNamed(
                                      context, RouteString.KEY_WORDS_SCREEN);
                                },
                              );
                            },
                          )
                        ],
                      )
                    : Container(),
          )
        ],
      ),
    );
  }
}
