// ignore_for_file: non_constant_identifier_names, duplicate_ignore, avoid_print

import 'dart:developer';
import 'package:adify/models/add_money_to_wallet_money.dart';
import 'package:adify/models/amount_modal.dart';
import 'package:adify/models/keywordmetrix.dart';
import 'package:adify/presentation/pages/home_screen.dart';
import 'package:adify/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/http_helper.dart';
import '../models/addkeyword_model.dart';
import '../models/calladsapi_model.dart';
import '../models/campaings_metrices.dart';
import '../models/createadcampain_model.dart';
import '../models/keywords_model.dart';
import '../models/location_suggestion_data.dart';
import '../models/negativekeyword_model.dart';
import '../models/onusercampain.dart';
import '../models/removekeyword_model.dart';
import '../models/suggestionbudget.dart';
import '../models/suggestmodal.dart';
import '../models/updateadurl.dart';
import '../models/updateheadline_model.dart';
import '../models/updatelocation_model.dart';
import '../presentation/widgets/custom_popup.dart';

class AddKeywordsController extends GetxController {
  final TextEditingController businessNameCtrl = TextEditingController();
  final TextEditingController websiteUrl = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController categoryCtrl = TextEditingController();
  final TextEditingController locationCtrl = TextEditingController();
  final TextEditingController addbidget = TextEditingController();
  RxString countryCode = "IN".obs;
  RxString languagecode = "en".obs;

  final TextEditingController addmoney = TextEditingController();
  final TextEditingController partsial = TextEditingController();

  TextEditingController updateBudgetController = TextEditingController();
  RxString fromdropdownvalue = 'Main Wallet'.obs;
  RxString todropdownvalue = 'Google Ads'.obs;
  RxInt groupValue = 0.obs;
  RxList search = [].obs;
  RxBool hide = true.obs;

  List selectedads = [0];
  RxMap campaindata = {}.obs;

  RxList keywordsList = [].obs;
  List<Positivekeywords> selectKeyword = [];
  List updateselectKeyword = [];
  List<Headlinemodel> selectedheadline = [];
  List<Descriptionmodel> selecteddees = [];
  List<Negativekeywords> selectnagative = [];

  RxList languageidlist = ["1234", "34353", "554"].obs;
  RxBool isadid = false.obs;
  List<Keyword> keyword = [];
  List campainmetrixlist = [];
  List keywordmetrixlist = [];
  Map adscalllist = {};
  Map locatiolist = {};
  List locationSugeetion = [];
  List suggestibudgetlist = [];
  // ignore: non_constant_identifier_names
  Map OnCampaindata = {};
  List<Suggestionmpodel> suggestionlist = [];
  List updateadurlist = [];
  RxString maxcpc = "10".obs;
  Map addkeyword = {};
  RxInt selectcpc = 10.obs;

  //Jeet
  Map addmoneytowallet = {};
  Map getbalance = {};
  Map gettransiction = {};
  Map amountTransfer = {};
  RxBool dataload = false.obs;

  Map headline = {};
  Map removekeyword = {};
  Map createadcampain = {};
  List locationData = [];
  List category = [];
  List pinnedhead = [
    {
      "pinned_headlines1": [
        {"text": "h1", "position": "ad1"},
        {"text": "h2", "position": "ad2"}
      ]
    },
    {
      "pinned_headlines2": [
        {"text": "h3", "position": "ad3"}
      ]
    },
    {
      "pinned_headlines3": [
        {"text": "H12333333123", "position": "ad3"}
      ]
    }
  ];
  List pinneddes = [
    {
      "pinned_description1": [
        {"text": "h1", "position": "ad1"},
        {"text": "h2", "position": "ad2"}
      ]
    },
    {
      "pinned_description2": [
        {"text": "h3", "position": "ad3"}
      ]
    }
  ];

  RxBool loading = false.obs;

  ///===== ... ONLY FOR LAST API CALL ( =  CRAETE AD CAMPAIN =  )USE +++ ////

  List<dynamic> headline_list = [];
  List<dynamic> location_ids = [];
  List<dynamic> positive_keywords = [];
  List<dynamic> negative_keywords = [];
  List list_of_discription = [];
  List<dynamic> pinned_headlines = [
    {
      "pinned_headlines1": [
        {"text": "h1", "position": "ad1"},
        {"text": "h2", "position": "ad2"}
      ]
    },
    {
      "pinned_headlines2": [
        {"text": "h3", "position": "ad3"}
      ]
    },
    {
      "pinned_headlines3": [
        {"text": "H12333333123", "position": "ad3"}
      ]
    }
  ];
  List<dynamic> pinned_descriptions = [
    {
      "pinned_description1": [
        {"text": "h1", "position": "ad1"},
        {"text": "h2", "position": "ad2"}
      ]
    },
    {
      "pinned_description2": [
        {"text": "h3", "position": "ad3"}
      ]
    }
  ];

  ///===== ... +++ = ==== = = ==   = == = = = == = = == = ====================   ///

  keywordsApiCall({
    Function? onTap,
  }) async {
    loading.value = true;
    KeywordsPostData keywordspostdata = KeywordsPostData(
      businessName: businessNameCtrl.text,
      landingUrl: websiteUrl.text,
      languageCode: languagecode.value,
      geoTargetConstant: phoneNumber.text,
      countryCode: countryCode.value,
    );
    List? data = await HttpHelper.keywordsApi(keywordspostdata.toJson());
    if (data != null) {
      keywordsList.addAll(data);
      onTap!();
    }
    loading.value = false;
  }

  categoryApiCall() async {
    loading.value = true;
    List? data = await HttpHelper.categoryApi();
    if (data != null) {
      category.addAll(data);
      debugPrint("===> new data ========> ${category.length}");
    }
    loading.value = false;
  }

  locationSuggetion() async {
    locationSugeetion.clear();
    LocationSuggestionPost? locationSuggestionPost = LocationSuggestionPost(
        location: locationCtrl.text, countryCode: countryCode.value);

    List? data =
        await HttpHelper.locationSuggestion(locationSuggestionPost.toJson());
    if (data != null) {
      locationSugeetion.addAll(data);
      debugPrint("====> locationSuggetion ===> ${locationSugeetion.length}");
    }
  }

  SuggestionsApiCall({
    required String businessName,
    required String businessCategory,
  }) async {
    Syggestions suggestionsModel = Syggestions(
        businessCategory: businessCategory, businessName: businessName);

    List? datatwo = await HttpHelper.suggest(suggestionsModel.toJson());
    if (datatwo != null) {
      debugPrint("===>  data suggestionlist========> $datatwo");
    }
  }

  RxBool CampainmetrixLoading = false.obs;

  CampainmetriXApicall({
    required String time,
  }) async {
    CampainmetrixLoading.value = true;
    campainmetrixlist.clear();
    CampainMetrix capmainm = CampainMetrix(time: time);
    List? datatwo = await HttpHelper.compaignMetrices(capmainm.toJson());
    if (datatwo != null) {
      campainmetrixlist.addAll(datatwo);
      debugPrint(
          "===>  campainmetrixlist   LIST   ========> ${campainmetrixlist.length}");
    }
    CampainmetrixLoading.value = false;
  }

  Updateadsurlapicall({
    required String path1,
    required String path2,
    required String url,
    required String adId,
  }) async {
    UpdateUrl adsurlupdate = UpdateUrl(
      adId: adId,
      url: url,
      path1: path1,
      path2: path2,
    );
    bool? data = await HttpHelper.Adurlupdate(adsurlupdate.toJson());
    if (data != null) {
      if (data) {
        updateData(campaingId: campaingId.value);
      }
    }
  }

  Keyworsmetrixapicall({
    required String time,
  }) async {
    KeywordmetriX keywordmetrix = KeywordmetriX(time: time);

    Map? datatwo = await HttpHelper.keywordmetrix(keywordmetrix.toJson());
    if (datatwo != null) {
      keywordmetrixlist = datatwo.values.toList();
      debugPrint(
          "===>  Keyworsmetrixapicall   LIST   ========> ${keywordmetrixlist.length}");
    }
  }

  Calladsapicall({
    required String campaignId,
    required String phoneCountry,
    required String phoneNumber,
  }) async {
    Callads calladsapp = Callads(
        campaignId: campaignId,
        phoneCountry: phoneCountry,
        phoneNumber: phoneNumber);
    Map? datatwo = await HttpHelper.Calladsapi(calladsapp.toJson());
    if (datatwo != null) {
      adscalllist = datatwo;
      updateData(campaingId: campaingId.value);
      debugPrint("===>  Calladsapicall   LIST   ========> $adscalllist");
    }
  }

  Updatelocatioapicall({
    required String campaignId,
    required List locationid,
  }) async {
    updatelocation updateloca =
        updatelocation(campaignId: campaignId, locationId: locationid);

    Map? datatwo = await HttpHelper.Locationupdate(updateloca.toJson());
    if (datatwo != null) {
      locatiolist = datatwo;
      updateData(campaingId: campaingId.value);
      debugPrint("===>  Location Update   LIST   ========> $locatiolist");
    }
  }

  // Oncapampainapicall({
  //   required String capmainid,
  // }) async {
  //   Oncampampain suggestionsModel = Oncampampain(campainid: capmainid);
  //
  //   Map? datatwo = await HttpHelper.Oneusercampain();
  //   if (datatwo != null) {
  //     OnCampaindata = datatwo;
  //
  //     debugPrint("===>  OnCampain  MODEL  ========> $OnCampaindata");
  //   }
  // }
  List budgetSug = [];

  suggestionbudget({
    required String businessName,
    required String countcode,
    required String businessCategory,
    required String geoTargetConstant,
    required String landingUrl,
  }) async {
    SugBudget sugBudget = SugBudget(
        businessName: businessName,
        languageCode: "en",
        countryCode: countcode,
        geoTargetConstant: geoTargetConstant,
        landingUrl: landingUrl);

    Map? datatwo = await HttpHelper.Sugestbudgetapi(sugBudget.toJson());
    if (datatwo != null) {
      print("-->>> ${datatwo.keys}");
      budgetSug = datatwo.keys.toList();
      suggestibudgetlist = datatwo.values.toList();
      debugPrint(
          "===>  suggestibudgetlist ========> ${suggestibudgetlist.length}");
    }
  }

  Addkeywordapicall({
    required String adgroupid,
    required String keywordText,
    required String matchType,
  }) async {
    Addkeyword addkeywors = Addkeyword(
        adGroupId: adgroupid, keywordText: keywordText, matchType: matchType);

    Map? datatwo = await HttpHelper.addsinglekeyword(addkeywors.toJson());
    if (datatwo != null) {
      addkeyword = datatwo;
      updateData(campaingId: campaingId.value);
      // keywordsApiCall();
      debugPrint("===>  addsinglekeyword ========> $addkeyword");
    }
  }

  AddNegativekeywordapicall({
    required String adgroupid,
    required String keywordText,
    required String matchType,
    required String negative,
  }) async {
    AddNegative addkeywors = AddNegative(
        adGroupId: adgroupid,
        keywordText: keywordText,
        matchType: matchType,
        nagetive: negative);

    Map? datatwo = await HttpHelper.adnagativekey(addkeywors.toJson());
    if (datatwo != null) {
      print("-->>>");
      addkeyword = datatwo;
      updateData(campaingId: campaingId.value);
      debugPrint("===>  AddNegativekeywordapicall ========> $addkeyword");
    }
  }

  updateheadlineapicall({
    required Updateheadline updateheadline,
  }) async {
    Map? datatwo = await HttpHelper.Updateheadline(updateheadline.toJson());
    if (datatwo != null) {
      headline = datatwo;
      SuggestionsApiCall(
          businessName: businessNameCtrl.text,
          businessCategory: categoryCtrl.text);
      debugPrint("===>  updateheadlineapicall ========> $headline");
    }
  }

  removekeywordapicall({
    required String adGroupId,
    required String criterionId,
  }) async {
    Removekeyword remove =
        Removekeyword(adGroupId: adGroupId, criterionId: criterionId);

    Map? datatwo = await HttpHelper.reemovekeyword(remove.toJson());
    if (datatwo != null) {
      removekeyword = datatwo;
      // keywordsApiCall();
      updateData(campaingId: campaingId.value);
      debugPrint("===>  removekeywordapicall ========> $removekeyword");
    } else {}
  }

  dataDispose() {
    positive_keywords.clear();
    headline_list.clear();
    list_of_discription.clear();
    pinned_descriptions.clear();
    pinned_headlines.clear();
    location_ids.clear();
    businessNameCtrl.clear();
    websiteUrl.clear();
    phoneNumber.clear();
  }

  CraeateadApicall() async {
    loading.value = true;
    log("=====> positive_keywords ====>   $positive_keywords");
    log("=====> headline_list ====>   $headline_list");
    log("=====> list_of_discription ====>   $list_of_discription");
    log("=====> pinned_descriptions ====>   $pinned_descriptions");
    log("=====> pinned_headlines ====>   $pinned_headlines");
    log("=====> location_ids ====>   $location_ids");
    Map data = {
      "bidding_strategy_cost": 234,
      "bidding_strategy_name":
          "${businessNameCtrl.text}${DateTime.now().microsecond}",
      "budget": 234,
      "business_name": businessNameCtrl.text,
      "campaign_name": "${businessNameCtrl.text}${DateTime.now().millisecond}",
      "country_code": "IN",
      "group_name": "${businessNameCtrl.text}${DateTime.now().minute}"
          "${businessNameCtrl.text}${DateTime.now().second}",
      "headlines_description": {
        "headline_list": headline_list,
        "list_of_discription": list_of_discription,
        "pinned_descriptions": [
          {
            "pinned_description1": [
              {"position": "ad1", "text": "h1"},
              {"position": "ad2", "text": "h2"}
            ]
          },
          {
            "pinned_description2": [
              {"position": "ad3", "text": "h3"}
            ]
          }
        ],
        "pinned_headlines": [
          {
            "pinned_headlines1": [
              {"position": "ad1", "text": "h1"},
              {"position": "ad2", "text": "h2"}
            ]
          },
          {
            "pinned_headlines2": [
              {"position": "ad3", "text": "h3"}
            ]
          },
        ]
      },
      "landing_url": "https://${websiteUrl.text}/",
      "language_code": "en",
      "language_ids": ["1000", "1003", "1001"],
      "location_ids": location_ids,
      "manual_cpc": "true",
      "max_cpc": 80000,
      "negative_keywords": negative_keywords,
      "path1": "htyjtj",
      "path2": "tujtjuyjuyj",
      "phone_number": phoneNumber.text,
      "positive_keywords": positive_keywords,
      "target_content_network": "false",
      "target_partner_search_network": "false",
      "target_search_network": "false"
    };
    log("=========> map data ======> $data");
    final datatwo = await HttpHelper.Createad(data);
    if (datatwo != null) {
      createadcampain = datatwo;
      debugPrint("===>  updateheadlineapicall ========> $createadcampain");
      Custompopup.showSnackTrue("Alert", datatwo['msg']);
      dataDispose();
      Get.offAll(() => const HomeScreen());
    } else {
      Get.snackbar("Somthing went wrong !", "Please try latter.",
          snackPosition: SnackPosition.TOP,
          colorText: AppColor.white,
          backgroundColor: AppColor.red);
    }
    loading.value = false;
  }

  Map updateDataGet = {};
  RxString adId = "".obs;
  RxString campaingId = "".obs;
  RxString budget_id = "".obs;
  RxString ad_group_id = "".obs;

  updateData({required String campaingId}) async {
    loading.value = true;
    updateDataGet.clear();
    Map? data = (await HttpHelper.Oneusercampain(AdId: campaingId));
    if (data != null) {
      updateDataGet = data;
      log("===> $data}");
      businessNameCtrl.text = updateDataGet["customer_obj"]["company_name"];
      categoryCtrl.text = updateDataGet["customer_obj"]["category"];
      websiteUrl.text = updateDataGet["campaign_obj"]["ads_and_groups"][0]
          ["ads"][0]["final_urls"];
      ad_group_id.value = updateDataGet["campaign_obj"]["ads_and_groups"][0]
          ["ad_group"]["ad_group_id"];
      locationData =
          updateDataGet["campaign_obj"]["compaign_data"]["location_id"];
      locationCtrl.text = locationData[0]["location"];
      debugPrint(
          "====>  ${updateDataGet["campaign_obj"]["ads_and_groups"][0]["keywords"]}");
      updateselectKeyword =
          updateDataGet["campaign_obj"]["ads_and_groups"][0]["keywords"];

      adId.value =
          updateDataGet["campaign_obj"]["ads_and_groups"][0]["ads"][0]["ad_id"];

      List calldata = updateDataGet["campaign_obj"]["compaign_data"]["call"];
      phoneNumber.text = calldata.isNotEmpty ? calldata[0]["phone_number"] : "";
      budget_id.value =
          updateDataGet["campaign_obj"]["compaign_data"]["budget_id"];
      // updateBudgetController.text =
      //     updateDataGet["campaign_obj"]["compaign_data"]["budget_amount"];
      debugPrint(
          "====>budget_id ======> ${updateDataGet["campaign_obj"]["compaign_data"]["budget_id"]}");
      debugPrint(
          "====>budget ampunt  ======> ${updateDataGet["campaign_obj"]["compaign_data"]["budget_amount"]}");
    }
    loading.value = false;
  }

  addmoneytowalletApicall(
      {required String amount, required Function onTap}) async {
    AddMoneyToWallet addMoneyToWallet = AddMoneyToWallet(amount: amount);
    Map? datatwo = await HttpHelper.addmoneywallet(addMoneyToWallet.toJson());
    if (datatwo != null) {
      addmoneytowallet = datatwo;
      onTap();
      debugPrint("===>  addsinglekeyword ========> $addmoneytowallet");
    }
  }

  getBalanceApicall() async {
    Map? datatwo = await HttpHelper.getbalance();
    if (datatwo != null) {
      getbalance = datatwo;

      debugPrint("===>  addsinglekeyword ========> $getbalance");
    }
  }

  List usertransactionList = [];

  getTransictionApicall() async {
    Map? datatwo = await HttpHelper.gettransiction();
    usertransactionList.clear();
    if (datatwo != null) {
      usertransactionList = datatwo["transactions_list"];
      // gettransiction = datatwo;
      debugPrint("===>  addsinglekeyword ========> $gettransiction");
    }
  }

  AmountTransferApicall(int amount) async {
    AmuonttransferModel amuonttransferModel =
        AmuonttransferModel(amount: amount);
    Map? datatwo =
        await HttpHelper.amountTransferApicall(amuonttransferModel.toJson());
    if (datatwo != null) {
      amountTransfer = datatwo;
      debugPrint("===>  addsinglekeyword ========> $amountTransfer");
    }
  }

  updateAmount({
    required String budgetId,
    required int amount,
  }) {
    HttpHelper.updateAmount(
      budgetId: budgetId,
      amount: amount,
    );
  }
}
