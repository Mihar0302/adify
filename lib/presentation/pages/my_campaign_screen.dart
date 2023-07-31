import 'package:adify/controller/add_keywords_controller.dart';
import 'package:adify/controller/global_controller.dart';
import 'package:adify/helper/http_helper.dart';
import 'package:adify/presentation/widgets/custom_empty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adify/presentation/widgets/custom_appbar.dart';
import 'package:adify/utils/app_color.dart';
import '../../utils/app_image.dart';
import '../widgets/custom_report_container.dart';
import '../widgets/string_stream.dart';
import 'google_ad_module/create_ad_bussiness_screen.dart';

class MyCampaignScreen extends StatefulWidget {
  const MyCampaignScreen({Key? key}) : super(key: key);

  @override
  State<MyCampaignScreen> createState() => _MyCampaignScreenState();
}

class _MyCampaignScreenState extends State<MyCampaignScreen> {
  RxInt tabIndex = 0.obs;
  AddKeywordsController addKeywordsController = Get.find();
  final GlobalController global = Get.find();
  final stringData = StringStream();
  RxString dropDownValue = "".obs;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: addKeywordsController.campainmetrixlist.isEmpty
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          CustomAppbar(
            size: size,
            onClick: () {
              global.tabIndex.value = 0;
            },
            campaing: true,
            mainLabel: "My campaign",
            widgetShow: false,
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
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          //   child: Row(
          //     children: [
          //       Image.asset(AppImages.filter, height: size.height * 0.028),
          //       SizedBox(width: size.width * 0.005),
          //       Text(
          //         "Filter",
          //         style: TextStyle(
          //           letterSpacing: 0.34,
          //           fontWeight: FontWeight.w500,
          //           fontSize: size.width * 0.04,
          //           color: AppColor.btnColor,
          //         ),
          //       ),
          //       Expanded(child: Container()),
          //       Text(
          //         "7 Days",
          //         style: TextStyle(
          //           letterSpacing: 0.34,
          //           color: AppColor.grey,
          //           fontSize: size.width * 0.036,
          //           fontWeight: FontWeight.w500,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // SizedBox(height: size.height * 0.025),
          Obx(
            () => tabIndex.value == 0
                ? addKeywordsController.CampainmetrixLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : addKeywordsController.campainmetrixlist.isEmpty
                        ? CustomEmpty(size: size)
                        : Column(
                            children: [
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: addKeywordsController
                                    .campainmetrixlist.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, int i) {
                                  return CustomReportContainer(
                                    size: size,
                                    firstText: addKeywordsController
                                        .campainmetrixlist[i]['clicks']
                                        .toString(),
                                    secondText: addKeywordsController
                                        .campainmetrixlist[i]['impressions']
                                        .toString(),
                                    threeText: addKeywordsController
                                        .campainmetrixlist[i]['conversions']
                                        .toString(),
                                    fourText: addKeywordsController
                                        .campainmetrixlist[i]['cost_micros']
                                        .toString(),
                                    widget: Row(
                                      children: [
                                        SizedBox(
                                          width: Get.width / 2.5,
                                          child: Text(
                                            addKeywordsController
                                                .campainmetrixlist[i]
                                                    ['campaign_name']
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              letterSpacing: 0.34,
                                              fontWeight: FontWeight.w500,
                                              fontSize: size.width * 0.044,
                                            ),
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                        Image.asset(
                                          AppImages.dott,
                                          height: size.height * 0.008,
                                          color: AppColor.grey.withOpacity(0.5),
                                        ),
                                        SizedBox(width: size.width * 0.02),
                                        Text(
                                          "Search",
                                          style: TextStyle(
                                            letterSpacing: 0.34,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.grey,
                                            fontSize: size.width * 0.033,
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                        addKeywordsController
                                                        .campainmetrixlist[i]
                                                    ['status'] ==
                                                "ENABLED"
                                            ? InkWell(
                                                onTap: () async {
                                                  debugPrint("sdfdsfds");
                                                  await HttpHelper.pausedCampaign(
                                                      campaignId:
                                                          addKeywordsController
                                                              .campainmetrixlist[
                                                                  i][
                                                                  'campaign_id']
                                                              .toString());
                                                  addKeywordsController
                                                      .CampainmetriXApicall(
                                                          time: "TODAY");
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        size.height * 0.0027,
                                                    horizontal:
                                                        size.width * 0.02,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: AppColor.green
                                                        .withOpacity(0.15),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "ACTIVE",
                                                        style: TextStyle(
                                                          letterSpacing: 0.34,
                                                          color: AppColor.green,
                                                          fontSize: size.width *
                                                              0.033,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: size.width *
                                                              0.001),
                                                      Icon(
                                                          Icons
                                                              .keyboard_arrow_right_outlined,
                                                          color: AppColor.green,
                                                          size: size.height *
                                                              0.025),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () async {
                                                  await HttpHelper.resumeCampaign(
                                                      campaignId:
                                                          addKeywordsController
                                                              .campainmetrixlist[
                                                                  i][
                                                                  'campaign_id']
                                                              .toString());
                                                  addKeywordsController
                                                      .CampainmetriXApicall(
                                                          time: "TODAY");
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        size.height * 0.0027,
                                                    horizontal:
                                                        size.width * 0.02,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: AppColor.ambr
                                                        .withOpacity(0.15),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "PAUSED",
                                                        style: TextStyle(
                                                          letterSpacing: 0.34,
                                                          color: AppColor.ambr,
                                                          fontSize: size.width *
                                                              0.033,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: size.width *
                                                              0.001),
                                                      Icon(
                                                          Icons
                                                              .keyboard_arrow_right_outlined,
                                                          color: AppColor.ambr,
                                                          size: size.height *
                                                              0.025),
                                                    ],
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                    onClick: () {
                                      addKeywordsController.campaingId.value =
                                          "${addKeywordsController.campainmetrixlist[i]['campaign_id']}";
                                      debugPrint(
                                          "====> campaing id ===> ${addKeywordsController.campainmetrixlist[i]['campaign_id']}");
                                      Get.to(() => CreateAdBusinessScreen(
                                            campaingId:
                                                "${addKeywordsController.campainmetrixlist[i]['campaign_id']}",
                                            update: true,
                                          ));
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
                                      "Adify India",
                                      style: TextStyle(
                                        letterSpacing: 0.34,
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.width * 0.044,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Image.asset(
                                      AppImages.dott,
                                      height: size.height * 0.008,
                                      color: AppColor.grey.withOpacity(0.5),
                                    ),
                                    SizedBox(width: size.width * 0.02),
                                    Text(
                                      "Search",
                                      style: TextStyle(
                                        letterSpacing: 0.34,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.grey,
                                        fontSize: size.width * 0.033,
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
                                          SizedBox(width: size.width * 0.001),
                                          Icon(
                                              Icons
                                                  .keyboard_arrow_right_outlined,
                                              color: AppColor.ambr,
                                              size: size.height * 0.025),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                onClick: () {
                                  // Navigator.pushNamed(
                                  //     context, RouteString.ADS_GROUPS_SCREEN);
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
