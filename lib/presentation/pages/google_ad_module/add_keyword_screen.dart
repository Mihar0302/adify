// ignore_for_file: avoid_print, non_constant_identifier_names, duplicate_ignore

import 'package:adify/controller/global_controller.dart';
import 'package:adify/presentation/pages/google_ad_module/create_ad_preview_screen.dart';
import 'package:adify/presentation/pages/google_ad_module/widgets/add_keyword_bottomsheet.dart';
import 'package:adify/presentation/widgets/custom_appbar.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/add_keywords_controller.dart';
import '../../../models/createadcampain_model.dart';
import 'create_ad_bussiness_screen.dart';
import 'widgets/next_buttoon_widget.dart';

class AddKeyWordScreen extends StatefulWidget {
  final bool updates;

  const AddKeyWordScreen({super.key, required this.updates});

  @override
  State<AddKeyWordScreen> createState() => _AddKeyWordScreenState();
}

class _AddKeyWordScreenState extends State<AddKeyWordScreen> {
  final AddKeywordsController addKeywordsController =
      Get.put(AddKeywordsController());
  TextEditingController keyword = TextEditingController();
  final GlobalController globalController = Get.find();
  RxString type = "BROAD".obs;
  RxInt tab = 0.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.scaffoldBackColor,
      body: Obx(
        () => addKeywordsController.loading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  appBar(size),
                  SizedBox(height: size.height * 0.02),
                  tabBar(size),
                  addKeywordsController.dataload.value == false
                      ? Expanded(
                          child: SingleChildScrollView(
                            child: Obx(
                              () => tab.value == 0
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.05),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: size.height * 0.03),
                                          addKeyWordButton(size),
                                          SizedBox(height: size.height * 0.03),
                                          widget.updates
                                              ? Container()
                                              : addKeywordsController
                                                      .selectKeyword.isNotEmpty
                                                  ? SelectaddedKeywordList(size,
                                                      addKeywordsController)
                                                  : Container(),
                                          addedKeywordList(widget.updates, size,
                                              addKeywordsController),
                                          SizedBox(height: size.height / 8),
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.05),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: size.height * 0.03),
                                          getKeyWordsIdeaButton(size),
                                          SizedBox(height: size.height * 0.03),
                                          SelectNagativeList(
                                              size, addKeywordsController),
                                          SizedBox(height: size.height / 8),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                        )
                      : const Expanded(
                          child: SizedBox(
                          child: Center(
                            child: CircularProgressIndicator(strokeWidth: 3),
                          ),
                        )),
                  widget.updates
                      ? Center(
                          child: UpdateBtn(
                            size: size,
                            btnName: "Save & Update",
                            onClick: () {
                              addKeywordsController.updateData(
                                  campaingId:
                                      addKeywordsController.campaingId.value);
                            },
                          ),
                        )
                      : Container(),
                  SizedBox(height: size.height * 0.01),
                  !widget.updates
                      ? addKeywordsController.selectKeyword.isNotEmpty &&
                              addKeywordsController.dataload.value == false
                          ? Row(
                              children: [
                                SizedBox(width: size.width * 0.1),
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
                                        addKeywordsController.positive_keywords
                                            .clear();
                                        addKeywordsController.negative_keywords
                                            .clear();

                                        addKeywordsController
                                                .positive_keywords =
                                            addKeywordsController.selectKeyword
                                                .map((e) => e.toJson())
                                                .toList();
                                        addKeywordsController
                                                .negative_keywords =
                                            addKeywordsController.selectnagative
                                                .map((e) => e.toJson())
                                                .toList();
                                        setState(() {});
                                        Get.to(() => CreateAdPriviewScreen(
                                            updates: widget.updates));
                                        debugPrint(
                                            "==> ${addKeywordsController.positive_keywords}");
                                      },
                                      size: size),
                                ),
                              ],
                            )
                          : const SizedBox(
                              height: 0,
                            )
                      : addKeywordsController.updateselectKeyword.isNotEmpty &&
                              addKeywordsController.dataload.value == false
                          ? Row(
                              children: [
                                SizedBox(width: size.width * 0.1),
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
                                        addKeywordsController.positive_keywords
                                            .clear();
                                        addKeywordsController.negative_keywords
                                            .clear();

                                        addKeywordsController
                                                .positive_keywords =
                                            addKeywordsController.selectKeyword
                                                .map((e) => e.toJson())
                                                .toList();
                                        addKeywordsController
                                                .negative_keywords =
                                            addKeywordsController.selectnagative
                                                .map((e) => e.toJson())
                                                .toList();
                                        setState(() {});
                                        Get.to(() => CreateAdPriviewScreen(
                                            updates: widget.updates));

                                        debugPrint(
                                            "===> ${addKeywordsController.selectKeyword}");
                                      },
                                      size: size),
                                ),
                              ],
                            )
                          : const SizedBox(
                              height: 0,
                            ),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
      ),
    );
  }

  ListView addedKeywordList(
      bool updates, Size size, AddKeywordsController addKeywordsController) {
    return updates
        ? ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: addKeywordsController.updateselectKeyword.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              width: size.width,
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.035),
              margin: EdgeInsets.only(
                  bottom: index == 7 ? 0.0 : size.height * 0.020),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      addKeywordsController.updateselectKeyword[index]
                          ["keyword_text"],
                      style: TextStyle(
                        letterSpacing: 0.34,
                        color: AppColor.textBlackColor,
                        fontSize: size.width * 0.037,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (widget.updates) {
                        addKeywordsController.removekeywordapicall(
                          adGroupId: addKeywordsController
                              .updateselectKeyword[index]["ad_group_id"],
                          criterionId: addKeywordsController
                              .updateselectKeyword[index]["keyword_id"],
                        );
                        // keyword.text = addKeywordsController
                        //     .updateselectKeyword[index]["keyword_text"];
                        // type.value = addKeywordsController
                        //     .updateselectKeyword[index]["match_type"];
                        // showModalBottomSheet(
                        //     shape: const RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.vertical(
                        //           top: Radius.circular(15)),
                        //     ),
                        //     isScrollControlled: true,
                        //     backgroundColor: AppColor.secondaryColor,
                        //     context: context,
                        //     builder: (BuildContext context) {
                        //       return Obx(
                        //         () => AddKeywordBottomSheet(
                        //           onCLick: () {
                        //             if (widget.updates) {
                        //               addKeywordsController.Addkeywordapicall(
                        //                   adgroupid: addKeywordsController
                        //                           .updateselectKeyword[index]
                        //                       ["ad_group_id"],
                        //                   keywordText: addKeywordsController
                        //                           .updateselectKeyword[index]
                        //                       ["keyword_text"],
                        //                   matchType: addKeywordsController
                        //                           .updateselectKeyword[index]
                        //                       ["match_type"]);
                        //               keyword.clear();
                        //               type.value = "";
                        //             }
                        //           },
                        //           size: size,
                        //           addKeywordsController: addKeywordsController,
                        //           tab: tab.value,
                        //           keywordCtrl: keyword,
                        //           type: type.value,
                        //           onTap1: () {
                        //             type.value = "BROAD";
                        //           },
                        //           onTap2: () {
                        //             type.value = "PHRASE";
                        //           },
                        //           onTap3: () {
                        //             type.value = "EXACT";
                        //           },
                        //         ),
                        //       );
                        //     });
                      } else {
                        addKeywordsController.updateselectKeyword
                            .removeAt(index);
                        setState(() {});
                      }

                      // keyword.text = addKeywordsController.keywordsList[index];
                      // showModalBottomSheet(
                      //     shape: const RoundedRectangleBorder(
                      //       borderRadius:
                      //           BorderRadius.vertical(top: Radius.circular(15)),
                      //     ),
                      //     isScrollControlled: true,
                      //     backgroundColor: AppColor.secondaryColor,
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return Obx(
                      //         () => AddKeywordBottomSheet(
                      //           size: size,
                      //           addKeywordsController: addKeywordsController,
                      //           tab: tab.value,
                      //           keywordCtrl: keyword,
                      //           type: type.value,
                      //           onTap1: () {
                      //             type.value = "BRAND";
                      //           },
                      //           onTap2: () {
                      //             type.value = "PHARSE";
                      //           },
                      //           onTap3: () {
                      //             type.value = "EXACT";
                      //           },
                      //         ),
                      //       );
                      //     });
                      // // AddKeywordData addKeywordData = AddKeywordData(
                      // //     keywordText: keywordCtrl.text,
                      // //     match_type: type,
                      // //     max_cpc: '123');
                      // // addKeywordsController.selectKeyword.add(addKeywordData);
                    },
                    child: Text(
                      "Remove",
                      style: TextStyle(
                        letterSpacing: 0.34,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * 0.037,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: addKeywordsController.keywordsList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              width: size.width,
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width * 0.035),
              margin: EdgeInsets.only(
                  bottom: index == 7 ? 0.0 : size.height * 0.020),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      addKeywordsController.keywordsList[index],
                      style: TextStyle(
                        letterSpacing: 0.34,
                        color: AppColor.textBlackColor,
                        fontSize: size.width * 0.037,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      keyword.text = addKeywordsController.keywordsList[index];
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(15)),
                          ),
                          isScrollControlled: true,
                          backgroundColor: AppColor.secondaryColor,
                          context: context,
                          builder: (BuildContext context) {
                            return Obx(
                              () => AddKeywordBottomSheet(
                                onCLick: () {
                                  Positivekeywords addKeywordData =
                                      Positivekeywords(
                                          keyword_text: keyword.text,
                                          match_type: type.value,
                                          max_cpc: 123);
                                  addKeywordsController.selectKeyword
                                      .add(addKeywordData);
                                  setState(() {});
                                  // addKeywordsController.Addkeywordapicall(
                                  //     adgroupid: "153518192870",
                                  //     keywordText: keywordCtrl.text,
                                  //     matchType: type.toString());
                                  addKeywordsController.keywordsList
                                      .removeAt(index);
                                  Get.back();
                                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  //     content:
                                  //         Text(addKeywordsController.addkeyword['msg'].toString())));
                                  // addKeywordsController.keywordsApiCall();
                                },
                                size: size,
                                addKeywordsController: addKeywordsController,
                                tab: tab.value,
                                keywordCtrl: keyword,
                                type: type.value,
                                onTap1: () {
                                  type.value = "BROAD";
                                },
                                onTap2: () {
                                  type.value = "PHRASE";
                                },
                                onTap3: () {
                                  type.value = "EXACT";
                                },
                              ),
                            );
                          });

                      // AddKeywordData addKeywordData = AddKeywordData(
                      //     keywordText: keywordCtrl.text,
                      //     match_type: type,
                      //     max_cpc: '123');
                      // addKeywordsController.selectKeyword.add(addKeywordData);
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(
                        letterSpacing: 0.34,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * 0.037,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  // ignore: non_constant_identifier_names
  ListView SelectaddedKeywordList(
      Size size, AddKeywordsController addKeywordsController) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: addKeywordsController.selectKeyword.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
        width: size.width,
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02, horizontal: size.width * 0.035),
        margin: EdgeInsets.only(bottom: index == 7 ? 0.0 : size.height * 0.020),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                addKeywordsController.selectKeyword[index].keyword_text,
                style: TextStyle(
                  letterSpacing: 0.34,
                  color: AppColor.textBlackColor,
                  fontSize: size.width * 0.037,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                addKeywordsController.keywordsList.add(
                    addKeywordsController.selectKeyword[index].keyword_text);
                addKeywordsController.selectKeyword.removeAt(index);

                setState(() {});
                // keyword.text = addKeywordsController.keywordsList[index];
                // showModalBottomSheet(
                //     shape: const RoundedRectangleBorder(
                //       borderRadius:
                //           BorderRadius.vertical(top: Radius.circular(15)),
                //     ),
                //     isScrollControlled: true,
                //     backgroundColor: AppColor.secondaryColor,
                //     context: context,
                //     builder: (BuildContext context) {
                //       return Obx(
                //         () => AddKeywordBottomSheet(
                //           size: size,
                //           addKeywordsController: addKeywordsController,
                //           tab: tab.value,
                //           keywordCtrl: keyword,
                //           type: type.value,
                //           onTap1: () {
                //             type.value = "BRAND";
                //           },
                //           onTap2: () {
                //             type.value = "PHARSE";
                //           },
                //           onTap3: () {
                //             type.value = "EXACT";
                //           },
                //         ),
                //       );
                //     });
                // // AddKeywordData addKeywordData = AddKeywordData(
                // //     keywordText: keywordCtrl.text,
                // //     match_type: type,
                // //     max_cpc: '123');
                // // addKeywordsController.selectKeyword.add(addKeywordData);
              },
              child: Text(
                "Remove",
                style: TextStyle(
                  letterSpacing: 0.34,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.037,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ListView SelectNagativeList(
      Size size, AddKeywordsController addKeywordsController) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: addKeywordsController.selectnagative.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
        width: size.width,
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02, horizontal: size.width * 0.035),
        margin: EdgeInsets.only(bottom: index == 7 ? 0.0 : size.height * 0.020),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                addKeywordsController.selectnagative[index].keyword_text,
                style: TextStyle(
                  letterSpacing: 0.34,
                  color: AppColor.textBlackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: size.width * 0.037,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                addKeywordsController.selectnagative.removeAt(index);
                setState(() {});
                // keyword.text = addKeywordsController.keywordsList[index];
                // showModalBottomSheet(
                //     shape: const RoundedRectangleBorder(
                //       borderRadius:
                //           BorderRadius.vertical(top: Radius.circular(15)),
                //     ),
                //     isScrollControlled: true,
                //     backgroundColor: AppColor.secondaryColor,
                //     context: context,
                //     builder: (BuildContext context) {
                //       return Obx(
                //         () => AddKeywordBottomSheet(
                //           size: size,
                //           addKeywordsController: addKeywordsController,
                //           tab: tab.value,
                //           keywordCtrl: keyword,
                //           type: type.value,
                //           onTap1: () {
                //             type.value = "BRAND";
                //           },
                //           onTap2: () {
                //             type.value = "PHARSE";
                //           },
                //           onTap3: () {
                //             type.value = "EXACT";
                //           },
                //         ),
                //       );
                //     });
                // // AddKeywordData addKeywordData = AddKeywordData(
                // //     keywordText: keywordCtrl.text,
                // //     match_type: type,
                // //     max_cpc: '123');
                // // addKeywordsController.selectKeyword.add(addKeywordData);
              },
              child: Text(
                "Remove",
                style: TextStyle(
                  letterSpacing: 0.34,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.037,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget keyWordLableText(Size size) {
    return Text(
      'Keyword',
      style: TextStyle(
          letterSpacing: 0.34,
          color: AppColor.textGreyColor,
          fontSize: size.width * 0.03,
          fontWeight: FontWeight.w600),
    );
  }

  Widget getKeyWordsIdeaButton(Size size) {
    return InkWell(
        onTap: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              isScrollControlled: true,
              backgroundColor: AppColor.secondaryColor,
              context: context,
              builder: (BuildContext context) {
                return Obx(
                  () => AddKeywordBottomSheet(
                    onCLick: () {
                      Negativekeywords addKeywordData = Negativekeywords(
                          keyword_text: keyword.text,
                          match_type: type.toString());
                      addKeywordsController.selectnagative.add(addKeywordData);
                      setState(() {});
                      addKeywordsController.AddNegativekeywordapicall(
                          adgroupid: addKeywordsController.ad_group_id.value,
                          negative: "true",
                          keywordText: keyword.text,
                          matchType: type.toString());
                      Get.back();
                    },
                    size: size,
                    addKeywordsController: addKeywordsController,
                    tab: tab.value,
                    keywordCtrl: keyword,
                    type: type.value,
                    onTap1: () {
                      type.value = "BROAD";
                    },
                    onTap2: () {
                      type.value = "PHRASE";
                    },
                    onTap3: () {
                      type.value = "EXACT";
                    },
                  ),
                );
              });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              color: AppColor.btnColor,
            ),
            SizedBox(width: size.width * 0.015),
            Text(
              'Add negative Keywords',
              style: TextStyle(
                letterSpacing: 0.34,
                fontWeight: FontWeight.w500,
                color: AppColor.red,
                fontSize: size.width * 0.039,
              ),
            ),
          ],
        ));
  }

  Widget addKeyWordButton(Size size) {
    return InkWell(
        onTap: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              isScrollControlled: true,
              backgroundColor: AppColor.secondaryColor,
              context: context,
              builder: (BuildContext context) {
                return Obx(
                  () => AddKeywordBottomSheet(
                    onCLick: () {
                      Positivekeywords addKeywordData = Positivekeywords(
                          keyword_text: keyword.text,
                          match_type: type.value,
                          max_cpc: 123);
                      addKeywordsController.selectKeyword.add(addKeywordData);
                      if (widget.updates) {
                        addKeywordsController.Addkeywordapicall(
                          adgroupid: addKeywordsController.ad_group_id.value,
                          keywordText: keyword.text,
                          matchType: type.value,
                        );
                      }
                      setState(() {});
                      // addKeywordsController.AddNegativekeywordapicall(
                      //     adgroupid: "153518192870",
                      //     negative: "true",
                      //     keywordText: keywordCtrl.text,
                      //     matchType: type.toString());
                      Get.back();
                    },
                    size: size,
                    addKeywordsController: addKeywordsController,
                    tab: tab.value,
                    keywordCtrl: keyword,
                    type: type.value,
                    onTap1: () {
                      type.value = "BROAD";
                    },
                    onTap2: () {
                      type.value = "PHRASE";
                    },
                    onTap3: () {
                      type.value = "EXACT";
                    },
                  ),
                );
              });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              color: AppColor.btnColor,
            ),
            SizedBox(width: size.width * 0.015),
            Text(
              'Add keywords',
              style: TextStyle(
                letterSpacing: 0.34,
                fontWeight: FontWeight.w500,
                color: AppColor.btnColor,
                fontSize: size.width * 0.039,
              ),
            ),
          ],
        ));
  }

  Widget appBar(Size size) {
    return CustomAppbar(
      mainLabel: "KEYWORDS",
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
            child: Image.asset(AppImages.diamond, height: size.height * 0.028),
          ),
        ],
      ),
    );
  }

  Widget tabBar(Size size) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
                2,
                (index) => GestureDetector(
                      onTap: () {
                        tab.value = index;
                        print(tab.value);
                      },
                      child: Container(
                        width: size.width / 2.2,
                        height: size.height * 0.05,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: tab.value == index
                                ? AppColor.btnColor
                                : AppColor.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 7,
                              )
                            ]),
                        child: Text(
                          ['Keywords', 'Negative Keyword'][index],
                          style: TextStyle(
                            letterSpacing: 0.34,
                            color: tab.value == index
                                ? AppColor.white
                                : AppColor.textGreyColor,
                            fontSize: size.width * 0.04,
                            fontWeight: tab.value == index
                                ? FontWeight.w600
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}

class AddKeywordData {
  final String keywordText;
  final int max_cpc;
  final String match_type;

  AddKeywordData({
    required this.keywordText,
    required this.match_type,
    required this.max_cpc,
  });
}
