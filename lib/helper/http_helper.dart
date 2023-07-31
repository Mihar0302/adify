// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable

import 'dart:convert';
import 'dart:developer';
import 'package:adify/controller/global_controller.dart';
import 'package:adify/presentation/widgets/custom_popup.dart';
import 'package:adify/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../controller/add_keywords_controller.dart';
import '../models/login_model.dart';
import '../models/onusercampain.dart';
import '../models/suggestmodal.dart';

class HttpHelper {
  static final http.Client _client = http.Client();
  static final GlobalController globalController = Get.find();
  static final AddKeywordsController keywordsController = Get.find();

  static Future<JwtTokenGet?> googleLoginApi(Map body) async {
    try {
      final response = await _client.post(
          Uri.parse("https://api.adify.tech/api/v1/google-login-mobile"),
          body: jsonEncode(body),
          headers: {
            'Content-type': 'application/json',
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("=====> googleLoginApi ======>>  ${response.body}");
        return JwtTokenGet.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("=====>  Error Register APi===> $e");

      return null;
    }
  }

  static Future<List?> categoryApi() async {
    List data = [];
    try {
      final response = await _client.get(
        Uri.parse("http://adifygoogle.pythonanywhere.com/get_list"),
      );
      debugPrint("=====> keywords  ======>>  ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("=====> keywords  ======>>  ${response.body}");
        data = (jsonDecode(response.body) as List);
        keywordsController.dataload.value = false;
        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        keywordsController.dataload.value = false;
        return null;
      }
    } catch (e) {
      keywordsController.dataload.value = false;
      debugPrint("=====>  Error categoryApi===> $e");
      return null;
    }
  }

  static Future<List?> keywordsApi(Map body) async {
    List data = [];
    try {
      final response = await _client.post(
        Uri.parse("https://api.adify.tech/api/v1/ads/suggestions/keywords"),
        body: jsonEncode(body),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
      );
      debugPrint("=====> keywords  ======>>  ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("=====> keywords  ======>>  ${response.body}");
        data = (jsonDecode(response.body) as List);
        keywordsController.dataload.value = false;
        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        keywordsController.dataload.value = false;
        return null;
      }
    } catch (e) {
      Custompopup.showSnack("Alert", e.toString());
      keywordsController.dataload.value = false;
      debugPrint("=====>  Error keywordsApi===> $e");
      return null;
    }
  }

  static Future<List?> locationSuggestion(Map body) async {
    List data = [];
    try {
      final response = await _client.post(
        Uri.parse("https://api.adify.tech/api/v1/ads/location_suggestion"),
        body: jsonEncode(body),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("=====> location_suggestion  ======>>  ${response.body}");
        data = (jsonDecode(response.body) as List);
        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      Custompopup.showSnack("Alert", e.toString());
      debugPrint("=====>  Error location_suggestion===> $e");
    }
    return null;
  }

  static Future<List?> compaignMetrices(Map body) async {
    List<dynamic> data = [];
    try {
      final response = await _client.post(
        Uri.parse("https://api.adify.tech/api/v1/update_ads/compaign-metrices"),
        body: jsonEncode(body),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("=====> compaignMetrices  ======>>  ${response.body}");
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        data = jsonMap['data'];
        print(data);
        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      // Custompopup.showSnack("Alert", e.toString());
      debugPrint("=====>  Error compaign-metrices===> $e");

      return null;
    }
  }

  static Future<Map?> keywordmetrix(Map body) async {
    Map data = {};
    try {
      final response = await _client.post(
        Uri.parse("https://api.adify.tech/api/v1/update_ads/keyword-metrices"),
        body: jsonEncode(body),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        data = jsonMap['data'];
        log("=====> keyword metrix  ======>>  $data");

        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      // Custompopup.showSnack("Alert", e.toString());
      debugPrint("=====>  Error keyword metrix  ===> $e");
      return null;
    }
  }

  static Future<List?> suggest(Map body) async {
    List<dynamic> data = [];

    try {
      keywordsController.dataload.value = true;
      final response = await _client.post(
        Uri.parse("https://api.adify.tech/api/v1/ads/suggestions"),
        body: jsonEncode(body),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
      );
      debugPrint(
          "=====> suggest ======>>  ${response.statusCode} =====>${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        keywordsController.dataload.value = false;

        Map<String, dynamic>? jsonResponse = jsonDecode(response.body);
        List<dynamic>? adList = jsonResponse?['ads'];

        for (int i = 0; i < adList!.length; i++) {
          Map<String, dynamic> adMap = adList[i];
          List<Descriptionmodel> descriptionList = [];
          List<Headlinemodel> headlineList = [];

          for (var description in adMap['description']) {
            descriptionList
                .add(Descriptionmodel(text: "$description", position: "ad2"));
          }

          for (var headline in adMap['headlines']) {
            headlineList.add(Headlinemodel(text: "$headline", position: "ad3"));
          }
          Suggestionmpodel ad = Suggestionmpodel(
            description: descriptionList,
            headlines: headlineList,
          );
          keywordsController.suggestionlist.add(ad);
        }
        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        keywordsController.dataload.value = false;
        return null;
      }
    } catch (e) {
      Custompopup.showSnack("Alert", e.toString());
      keywordsController.dataload.value = false;
      debugPrint(e.toString());
    }
    keywordsController.dataload.value = false;
    return null;
  }

  static Future<Map?> Sugestbudgetapi(Map body) async {
    Map data = {};
    try {
      final response = await _client.post(
        Uri.parse("https://api.adify.tech/api/v1/ads/suggestions/budgets"),
        body: jsonEncode(body),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
      );
      debugPrint(
          "=====> Sugestbudgetapi ======>>  ${response.statusCode} =====>");

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("=====> Sugestbudgetapi  ======>>  ${response.body}");
        Map jsonMap = jsonDecode(response.body);
        data = jsonMap;
        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      Custompopup.showSnack("Alert", e.toString());
      print(e.toString());
    }
    return null;
  }

  static Future<Map?> Oneusercampain({required String AdId}) async {
    Map<String, dynamic> data = {};
    try {
      final response = await _client.get(
        Uri.parse(
            "https://api.adify.tech/api/v1/data/one-user-campaigns?campaign_id=$AdId"),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
      );
      Map<String, dynamic> jsonMap = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (jsonMap['campaign_obj'] != null) {
          SuggestionModel suggestionModel = SuggestionModel.fromJson(jsonMap);
          keywordsController.keyword
              .addAll(suggestionModel.campaignObj.adsAndGroups[0].keywords);
          save("Customerobj", suggestionModel.customerObj);
        }
        keywordsController.loading.value = false;

        data = jsonMap;
        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        keywordsController.loading.value = false;

        return null;
      }
    } catch (e) {
      Custompopup.showSnack("Alert", e.toString());
      keywordsController.loading.value = false;

      debugPrint(e.toString());
    }
    return null;
  }

  static Future<bool?> Adurlupdate(Map body) async {
    List data = [];
    try {
      final response = await _client.post(
        Uri.parse("https://api.adify.tech/api/v1/update_ads/update-ad-url"),
        body: jsonEncode(body),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("=====> Adurlupdate  ======>>  ${response.body}");
        Custompopup.showSnackTrue("Alert", jsonDecode(response.body)["msg"]);
        Map jsonMap = jsonDecode(response.body);
        // data = jsonMap['data'];
        return true;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["msg"]);
        return null;
      }
    } catch (e) {
      debugPrint("====>Error ====> ${e.toString()}");
    }
    return null;
  }

  static Future<Map?> Calladsapi(Map body) async {
    Map data = {};
    try {
      final response = await _client.post(
        Uri.parse("https://api.adify.tech/api/v1/ads_settings/call-ads-api"),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Custompopup.showSnackTrue("Alert", jsonDecode(response.body)["msg"]);
        Map jsonMap = jsonDecode(response.body);
        data = jsonMap;
        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["msg"]);
        return null;
      }
    } catch (e) {
      Custompopup.showSnack("dfgdfgdfgdf", e.toString());
    }
    return null;
  }

  static Future<Map?> Locationupdate(Map BODY) async {
    Map data = {};
    try {
      debugPrint("---->>${json.encode(BODY)}");
      final response = await _client.post(
          Uri.parse(
              "https://api.adify.tech/api/v1/ads_settings/location-update"),
          headers: {
            'Content-type': 'application/json',
            "x-access-token": globalController.jwt.value
          },
          body: json.encode(BODY));
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("=====> Locationupdate  ======>>  ${response.body}");
        Custompopup.showSnackTrue("Alert", jsonDecode(response.body)["msg"]);
        Map jsonMap = jsonDecode(response.body);
        data = jsonMap;
        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      Custompopup.showSnack("Alert", e.toString());
      debugPrint("=====> Locationupdate ======>>  ${e.toString()}");
    }
    return null;
  }

  static Future<Map?> addsinglekeyword(Map body) async {
    Map data = {};
    debugPrint("---->>> BODY $body");
    try {
      keywordsController.dataload.value = true;

      final response = await _client.post(
        Uri.parse(
            "https://api.adify.tech/api/v1/update_ads/add-single-keyword"),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map jsonMap = jsonDecode(response.body);
        Custompopup.showSnackTrue("Alert", jsonDecode(response.body)["msg"]);
        data = jsonMap;
        keywordsController.dataload.value = false;
        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        keywordsController.dataload.value = false;
        return null;
      }
    } catch (e) {
      Custompopup.showSnack("Alert", e.toString());
      keywordsController.dataload.value = false;
    }
    return null;
  }

  static Future<Map?> adnagativekey(Map body) async {
    Map data = {};
    try {
      keywordsController.dataload.value = true;

      final response = await _client.post(
          Uri.parse(
              "https://api.adify.tech/api/v1/update_ads/add-single-keyword"),
          headers: {
            'Content-type': 'application/json',
            "x-access-token": globalController.jwt.value
          },
          body: jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("=====> NAGATIVE  ======>>  ${response.body}");
        Map jsonMap = jsonDecode(response.body);
        data = jsonMap;
        keywordsController.dataload.value = false;

        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        keywordsController.dataload.value = false;

        return null;
      }
    } catch (e) {
      keywordsController.dataload.value = false;

      debugPrint("=====> NAGATIVE  error  ======>>  ${e.toString()}");
    }
    return null;
  }

  static Future<Map?> Updateheadline(Map body) async {
    Map data = {};
    try {
      debugPrint("--- >> ${jsonEncode(body)}");
      keywordsController.dataload.value = true;
      final response = await _client.post(
          Uri.parse(
              "https://api.adify.tech/api/v1/update_ads/update-headline-description"),
          headers: {
            'Content-type': 'application/json',
            "x-access-token": globalController.jwt.value
          },
          body: jsonEncode(body));
      debugPrint(
          "=====> Updateheadline ======>>  ${response.statusCode} =====>${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        Custompopup.showSnackTrue("Alert", jsonDecode(response.body)["msg"]);
        debugPrint("=====> Updateheadline  ======>>  ${response.body}");
        Map jsonMap = jsonDecode(response.body);
        data = jsonMap;
        keywordsController.dataload.value = false;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        keywordsController.dataload.value = false;
        return null;
      }
    } catch (e) {
      keywordsController.dataload.value = false;
      debugPrint("=====> Updateheadline    ======>>  ${e.toString()}");
    }
    return null;
  }

  static Future<Map?> reemovekeyword(Map body) async {
    Map data = {};
    try {
      final response = await _client.post(
        Uri.parse(
            "https://api.adify.tech/api/v1/update_ads/remove-single-keyword"),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
        body: jsonEncode(body),
      );
      debugPrint(
        "=====> reemovekeyword ======>>  ${response.statusCode} =====>${response.body}",
      );
      Map jsonMap = jsonDecode(response.body);
      data = jsonMap;

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("=====> reemovekeyword  ======>>  ${response.body}");

        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        print("Nn==");

        return null;
      }
    } catch (e) {
      debugPrint("=====> reemovekeyword error    ======>>  ${e.toString()}");
    }
    return null;
  }

  static Future<Map?> Createad(Map body) async {
    Map data = {};
    keywordsController.loading.value = true;
    try {
      final response = await _client.post(
        Uri.parse("https://api.adify.tech/api/v1/ads/create-search-ads"),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value,
        },
        body: jsonEncode(body),
      );
      Map jsonMap = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Custompopup.showSnackTrue("Alert", jsonDecode(response.body)["msg"]);
        debugPrint("=====>  Createad  ======>> ${response.body}");
        data = jsonMap;
        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        debugPrint("=====>  Createad  error======>>${response.body}");
        keywordsController.loading.value = false;
        data = jsonMap;
        return data;
      }
    } catch (e) {
      debugPrint("=====>  Createad  CATCH ======>>");

      keywordsController.loading.value = false;
      debugPrint("=====> Createad error    ======>>  ${e.toString()}");
    }
    keywordsController.loading.value = false;
    return null;
  }

  static Future<Map?> addmoneywallet(Map body) async {
    Map data = {};
    try {
      final response = await _client.post(
        Uri.parse("https://api.adify.tech//api/v1/ads/create_order"),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
        body: jsonEncode(body),
      );
      debugPrint(
        "=====> addmoneywallet ======>>  ${response.statusCode} =====>${response.body}",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("=====>  addmoneywallet  ======>>  ${response.body}");
        Custompopup.showSnackTrue("Alert", response.body);
        Map jsonMap = jsonDecode(response.body);
        data = jsonMap;
        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      debugPrint("=====> addmoneywallet error    ======>>  ${e.toString()}");
    }
    return null;
  }

  static Future<Map?> getbalance() async {
    Map data = {};
    try {
      final response = await _client.post(
        Uri.parse(
            "https://api.adify.tech//api/v1/wallet_info/wallet-information"),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
      );
      debugPrint(
        "=====> getbalance ======>>  ${response.statusCode} =====>${response.body}",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("=====>  getbalance  ======>>  ${response.body}");
        Map jsonMap = jsonDecode(response.body);
        data = jsonMap;
        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      debugPrint("=====> getbalance error    ======>>  ${e.toString()}");
    }
    return null;
  }

  static Future<Map?> gettransiction() async {
    Map data = {};
    try {
      final response = await _client.post(
        Uri.parse(
            "https://api.adify.tech//api/v1/wallet_info/wallet-transactions"),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("=====>  gettransiction  ======>>  ${response.body}");
        Map jsonMap = jsonDecode(response.body);
        data = jsonMap;
        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      debugPrint("=====> getbalance error    ======>>  ${e.toString()}");
    }
    return null;
  }

  static Future<Map?> amountTransferApicall(Map body) async {
    Map data = {};
    try {
      final response = await _client.post(
        Uri.parse(
            "https://api.adify.tech//api/v1/billing/send-billing-request"),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
        body: jsonEncode(body),
      );
      debugPrint(
        "=====> amountTransfer ======>>  ${response.statusCode} =====>${response.body}",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["msg"]);
        debugPrint("=====>  amountTransfer  ======>>  ${response.body}");
        Map jsonMap = jsonDecode(response.body);
        data = jsonMap;
        return data;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body)["msg"]);
        return null;
      }
    } catch (e) {
      debugPrint("=====> amountTransfer"
          " error    ======>>  ${e.toString()}");
    }
    return null;
  }

  static Future<bool?> updateAmount({
    required String budgetId,
    required int amount,
  }) async {
    Map data = {};
    try {
      final response = await _client.post(
        Uri.parse("https://api.adify.tech/api/v1/ads_settings/budget_update"),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
        body: jsonEncode(
          {"budget_id": budgetId, "amount": amount},
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Custompopup.showSnackTrue("Alert", response.body);
        debugPrint("=====>  amountTransfer  ======>>  ${response.body}");
        // Map jsonMap = jsonDecode(response.body);
        // data = jsonMap;
        return true;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body));
        return null;
      }
    } catch (e) {
      debugPrint("=====> amountTransfer"
          " error    ======>>  ${e.toString()}");
    }
    return null;
  }

  static Future<bool?> pausedCampaign({required String campaignId}) async {
    try {
      final response = await _client.post(
        Uri.parse("https://api.adify.tech/api/v1/update_ads/pause-compaign"),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
        body: jsonEncode(
          {
            "campaign_id": campaignId,
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Custompopup.showSnackTrue("Alert", jsonDecode(response.body)["msg"]);
        debugPrint("=====>  amountTransfer  ======>>  ${response.body}");
        return true;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body));
        return null;
      }
    } catch (e) {
      debugPrint("=====> amountTransfer"
          " error    ======>>  ${e.toString()}");
    }
    return null;
  }

  static Future<bool?> resumeCampaign({required String campaignId}) async {
    Map data = {};
    try {
      final response = await _client.post(
        Uri.parse("https://api.adify.tech/api/v1/update_ads/resume-compaign"),
        headers: {
          'Content-type': 'application/json',
          "x-access-token": globalController.jwt.value
        },
        body: jsonEncode(
          {
            "campaign_id": campaignId,
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Custompopup.showSnackTrue("Alert", jsonDecode(response.body)["msg"]);
        debugPrint("=====>  amountTransfer  ======>>  ${response.body}");
        // Map jsonMap = jsonDecode(response.body);
        // data = jsonMap;
        return true;
      } else {
        Custompopup.showSnack("Alert", jsonDecode(response.body));
        return null;
      }
    } catch (e) {
      debugPrint("=====> amountTransfer"
          " error    ======>>  ${e.toString()}");
    }
    return null;
  }
}
