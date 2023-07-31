// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:adify/models/createadcampain_model.dart';
import 'package:adify/presentation/pages/google_ad_module/ads_budget_screen.dart';
import 'package:adify/presentation/pages/google_ad_module/widgets/custom_text_btn.dart';
import 'package:adify/presentation/pages/google_ad_module/widgets/next_buttoon_widget.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/add_keywords_controller.dart';
import '../../../controller/global_controller.dart';
import '../../../models/updateheadline_model.dart';
import 'widgets/edit_add_bottomsheet.dart';

class CreateAdPriviewScreen extends StatefulWidget {
  final bool updates;

  const CreateAdPriviewScreen({Key? key, required this.updates})
      : super(key: key);

  @override
  State<CreateAdPriviewScreen> createState() => _CreateAdPriviewScreenState();
}

class _CreateAdPriviewScreenState extends State<CreateAdPriviewScreen> {
  final AddKeywordsController keywordsController = Get.find();
  final GlobalController globalController = Get.find();

  ///====
  final TextEditingController heading1Ctrl = TextEditingController();
  final TextEditingController heading2Ctrl = TextEditingController();
  final TextEditingController heading3Ctrl = TextEditingController();
  final TextEditingController description1Ctrl = TextEditingController();
  final TextEditingController description2Ctrl = TextEditingController();

  final List adsOptions = [
    'Language',
    'Sitelink',
    'Structured Snippet',
    'Call out'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.scaffoldBackColor,
      body: Obx(
        () => Column(
          children: [
            appBar(context, size),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.022,
                  left: size.width * 0.05,
                  right: size.width * 0.05),
              child: headerWidget(size),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.01,
                  left: size.width * 0.05,
                  right: size.width * 0.05),
              child: progressWidget(size),
            ),
            SizedBox(height: size.height * 0.04),
            keywordsController.dataload.value == false
                ? keywordsController.suggestionlist.isEmpty
                    ? const Expanded(
                        child: SizedBox(
                        child: Center(
                          child: Text(
                            "No Data",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ))
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                itemCount:
                                    keywordsController.suggestionlist.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.only(
                                    right: size.width * 0.05,
                                    left: size.width * 0.03,
                                    top: size.height * 0.02),
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        keywordsController.selectedads
                                                .contains(index)
                                            ? Icons.check_circle
                                            : Icons.circle,
                                        color: keywordsController.selectedads
                                                .contains(index)
                                            ? AppColor.btnColor
                                            : const Color(0xffBFBFBF),
                                      ),
                                      SizedBox(width: size.width * 0.02),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            if (keywordsController.selectedads
                                                .contains(index)) {
                                              keywordsController.selectedads
                                                  .remove(index);
                                            } else {
                                              keywordsController.selectedads
                                                  .add(index);
                                            }
                                            print(
                                                keywordsController.selectedads);
                                            setState(() {});
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                bottom: size.height * 0.03),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.05,
                                                vertical: size.height * 0.02),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: AppColor.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Ad",
                                                      style: TextStyle(
                                                        fontSize:
                                                            size.width * 0.036,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            size.width * 0.01),
                                                    Container(
                                                      height: 5,
                                                      width: 5,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColor.grey
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            size.width * 0.02),
                                                    SizedBox(
                                                      width: size.width * 0.5,
                                                      child: Text(
                                                        keywordsController
                                                            .websiteUrl.text,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.width *
                                                                    0.027,
                                                            color:
                                                                AppColor.grey),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: Container()),
                                                    Icon(Icons.edit,
                                                        color:
                                                            AppColor.btnColor,
                                                        size:
                                                            size.width * 0.045),
                                                    SizedBox(
                                                        width:
                                                            size.width * 0.005),
                                                    InkWell(
                                                      onTap: () {
                                                        heading1Ctrl.text =
                                                            keywordsController
                                                                .suggestionlist[
                                                                    index]
                                                                .headlines[0]
                                                                .text;
                                                        heading2Ctrl.text =
                                                            keywordsController
                                                                .suggestionlist[
                                                                    index]
                                                                .headlines[1]
                                                                .text;
                                                        heading3Ctrl.text =
                                                            keywordsController
                                                                .suggestionlist[
                                                                    index]
                                                                .headlines[2]
                                                                .text;
                                                        description1Ctrl.text =
                                                            keywordsController
                                                                .suggestionlist[
                                                                    index]
                                                                .description[0]
                                                                .text;
                                                        description2Ctrl.text =
                                                            keywordsController
                                                                .suggestionlist[
                                                                    index]
                                                                .description[1]
                                                                .text;
                                                        showModalBottomSheet(
                                                          shape:
                                                              const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .vertical(
                                                              top: Radius
                                                                  .circular(15),
                                                            ),
                                                          ),
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              AppColor
                                                                  .secondaryColor,
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return EditAdsWidget(
                                                              onclik: () {
                                                                keywordsController
                                                                        .suggestionlist[
                                                                            index]
                                                                        .description[
                                                                            0]
                                                                        .text =
                                                                    description1Ctrl
                                                                        .text;
                                                                keywordsController
                                                                        .suggestionlist[
                                                                            index]
                                                                        .description[
                                                                            1]
                                                                        .text =
                                                                    description2Ctrl
                                                                        .text;
                                                                keywordsController
                                                                        .suggestionlist[
                                                                            index]
                                                                        .headlines[
                                                                            0]
                                                                        .text =
                                                                    heading1Ctrl
                                                                        .text;
                                                                keywordsController
                                                                        .suggestionlist[
                                                                            index]
                                                                        .headlines[
                                                                            1]
                                                                        .text =
                                                                    heading2Ctrl
                                                                        .text;
                                                                keywordsController
                                                                        .suggestionlist[
                                                                            index]
                                                                        .headlines[
                                                                            2]
                                                                        .text =
                                                                    heading3Ctrl
                                                                        .text;

                                                                setState(() {});
                                                                if (widget
                                                                    .updates) {
                                                                  Updateheadline
                                                                      updateheadline =
                                                                      Updateheadline(
                                                                          adId: keywordsController
                                                                              .adId
                                                                              .value,
                                                                          headlinesDescription:
                                                                              HeadlinesDescription(
                                                                            headline_list:
                                                                                keywordsController.suggestionlist[index].headlines,
                                                                            list_of_discription:
                                                                                keywordsController.suggestionlist[index].description,
                                                                            pinned_descriptions:
                                                                                keywordsController.pinneddes,
                                                                            pinned_headlines:
                                                                                keywordsController.pinnedhead,
                                                                          ));
                                                                  keywordsController
                                                                      .updateheadlineapicall(
                                                                          updateheadline:
                                                                              updateheadline);
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content: Text(keywordsController
                                                                          .headline[
                                                                              'msg']
                                                                          .toString()),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  setState(
                                                                      () {});
                                                                }
                                                                Get.back();
                                                              },
                                                              description1Ctrl:
                                                                  description1Ctrl,
                                                              description2Ctrl:
                                                                  description2Ctrl,
                                                              heading1Ctrl:
                                                                  heading1Ctrl,
                                                              heading2Ctrl:
                                                                  heading2Ctrl,
                                                              heading3Ctrl:
                                                                  heading3Ctrl,
                                                              size: size,
                                                              des: keywordsController
                                                                  .suggestionlist[
                                                                      index]
                                                                  .description,
                                                              head: keywordsController
                                                                  .suggestionlist[
                                                                      index]
                                                                  .headlines,
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Text(
                                                        "Edit",
                                                        style: TextStyle(
                                                          color:
                                                              AppColor.btnColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: size.width *
                                                              0.034,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height:
                                                        size.height * 0.012),
                                                Text(
                                                  "${keywordsController.suggestionlist[index].headlines[0].text},"
                                                  "${keywordsController.suggestionlist[index].headlines[1].text},"
                                                  "${keywordsController.suggestionlist[index].headlines[2].text}",
                                                  style: TextStyle(
                                                      letterSpacing: 0.34,
                                                      fontSize:
                                                          size.width * 0.036,
                                                      color: AppColor.btnColor),
                                                ),
                                                SizedBox(
                                                    height:
                                                        size.height * 0.015),
                                                Text(
                                                  "${keywordsController.suggestionlist[index].description[0].text},"
                                                  "${keywordsController.suggestionlist[index].description[1].text},",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                    letterSpacing: 0.34,
                                                    fontSize:
                                                        size.width * 0.034,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        size.height * 0.001),
                                                Divider(
                                                  thickness: 2,
                                                  color: AppColor.grey
                                                      .withOpacity(0.2),
                                                ),
                                                SizedBox(
                                                    height:
                                                        size.height * 0.001),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.call,
                                                      size: size.width * 0.05,
                                                      color: AppColor.btnColor,
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            size.width * 0.01),
                                                    Text(
                                                      keywordsController
                                                          .phoneNumber.text,
                                                      style: TextStyle(
                                                          color:
                                                              AppColor.btnColor,
                                                          fontSize: size.width *
                                                              0.038,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                : const Expanded(
                    child: SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 3),
                    ),
                  )),
            keywordsController.selectedads.isEmpty
                ? const SizedBox()
                : keywordsController.dataload.value == false &&
                        keywordsController.suggestionlist.isNotEmpty
                    ? Row(
                        children: [
                          SizedBox(width: size.width * 0.15),
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
                                title: 'Next',
                                globalController: globalController,
                                onClick: () {
                                  keywordsController.selectedheadline.clear();
                                  keywordsController.selecteddees.clear();
                                  keywordsController.headline_list.clear();
                                  keywordsController.list_of_discription
                                      .clear();

                                  for (int i
                                      in keywordsController.selectedads) {
                                    keywordsController.selecteddees.addAll(
                                        keywordsController
                                            .suggestionlist[i].description);
                                    keywordsController.selectedheadline.addAll(
                                        keywordsController
                                            .suggestionlist[i].headlines);
                                  }

                                  keywordsController.headline_list =
                                      keywordsController.selectedheadline
                                          .map((headline) => headline.toJson())
                                          .toList();
                                  List listofdiscription = keywordsController
                                      .selecteddees
                                      .map((headline) => headline.toJson())
                                      .toList();

                                  keywordsController.list_of_discription
                                      .add(listofdiscription.first);
                                  keywordsController.suggestionbudget(
                                      businessName: keywordsController
                                          .businessNameCtrl
                                          .toString(),
                                      countcode:
                                          keywordsController.countryCode.value,
                                      businessCategory: keywordsController
                                          .categoryCtrl
                                          .toString(),
                                      geoTargetConstant:
                                          keywordsController.phoneNumber.text,
                                      landingUrl:
                                          keywordsController.websiteUrl.text);
                                  Get.to(
                                    () => AdsBudgetScreen(
                                      updates: widget.updates,
                                    ),
                                  );
                                },
                                size: size),
                          ),
                        ],
                      )
                    : const SizedBox(),
            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }

  Widget premiumBtnList(Size size) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          size.width * 0.09, size.height * 0.03, 0.0, size.height * 0.012),
      // symmetric(
      //     horizontal: size.width * 0.09,
      //     vertical: size.height * 0.03),
      child: Column(
        children: List.generate(
          adsOptions.length,
          (index) => Padding(
            padding: EdgeInsets.only(
                bottom: index == 3 ? size.height * 0.015 : size.height * 0.03),
            child: CustomTextButton(
              size: size,
              text: adsOptions[index],
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }

  Widget divider(Size size) {
    return Container(
      width: size.width,
      height: 0.5,
      color: const Color(0xFFCFCFCF),
    );
  }

  Widget previewLable(Size size) {
    return Text(
      'Preview',
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
              color: AppColor.black, borderRadius: BorderRadius.circular(50)),
        ),
        Container(
          height: size.height * 0.013,
          width: size.width / 4.8,
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(50)),
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
            color: AppColor.black,
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
            color: AppColor.textGreyColor,
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
}
