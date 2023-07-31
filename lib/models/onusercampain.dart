// ignore_for_file: unused_import

import 'package:adify/models/updateheadline_model.dart';

import 'createadcampain_model.dart';

class Oncampampain {
  String? campainid;

  Oncampampain({required campainid});

  Oncampampain.fromJson(Map<String, dynamic> json) {
    campainid = json['campaign_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['campaign_id'] = campainid;
    return data;
  }
}

class SuggestionModel {
  final CampaignObj campaignObj;
  final CustomerObj customerObj;

  SuggestionModel({
    required this.campaignObj,
    required this.customerObj,
  });

  factory SuggestionModel.fromJson(Map<String, dynamic> json) {
    return SuggestionModel(
      campaignObj: CampaignObj.fromJson(json['campaign_obj']),
      customerObj: CustomerObj.fromJson(json['customer_obj']),
    );
  }
}

class CampaignObj {
  final CompaignData campaignData;
  final List<AdsAndGroups> adsAndGroups;

  CampaignObj({
    required this.campaignData,
    required this.adsAndGroups,
  });

  factory CampaignObj.fromJson(Map<String, dynamic> json) {
    return CampaignObj(
      campaignData: CompaignData.fromJson(json['compaign_data']),
      adsAndGroups: List<AdsAndGroups>.from(
          json['ads_and_groups'].map((x) => AdsAndGroups.fromJson(x))),
    );
  }
}

class CompaignData {
  final String id;
  final List<Call> call;
  final String budgetId;
  final int budgetAmount;
  final String budgetName;
  final String googleAdsAccountId;
  final String campaignId;
  final String campaignName;
  final String compaignStatus;
  final String languageCode;
  final bool targetSearchNetwork;
  final bool targetPartnerSearchNetwork;
  final bool targetContentNetwork;
  final String startDate;
  final String biddingStrategy;
  final List<LocationId> locationId;
  final List<String> languagesIds;
  final bool manualCpc;
  final bool isActive;
  final bool isDelete;
  final List<CustomerConversionGoal> customerConversionGoals;

  CompaignData({
    required this.id,
    required this.call,
    required this.budgetId,
    required this.budgetAmount,
    required this.budgetName,
    required this.googleAdsAccountId,
    required this.campaignId,
    required this.campaignName,
    required this.compaignStatus,
    required this.languageCode,
    required this.targetSearchNetwork,
    required this.targetPartnerSearchNetwork,
    required this.targetContentNetwork,
    required this.startDate,
    required this.biddingStrategy,
    required this.locationId,
    required this.languagesIds,
    required this.manualCpc,
    required this.isActive,
    required this.isDelete,
    required this.customerConversionGoals,
  });

  factory CompaignData.fromJson(Map<String, dynamic> json) {
    return CompaignData(
      id: json['_id'],
      call: List<Call>.from(json['call'].map((x) => Call.fromJson(x))),
      budgetId: json['budget_id'],
      budgetAmount: json['budget_amount'],
      budgetName: json['budget_name'],
      googleAdsAccountId: json['googleads_account_id'],
      campaignId: json['campaign_id'],
      campaignName: json['campaign_name'],
      compaignStatus: json['compaign_status'],
      languageCode: json['language_code'],
      targetSearchNetwork: json['target_search_network'],
      targetPartnerSearchNetwork: json['target_partner_search_network'],
      targetContentNetwork: json['target_content_network'],
      startDate: json['start_date'],
      biddingStrategy: json['bidding_strategy'],
      locationId: List<LocationId>.from(
          json['location_id'].map((x) => LocationId.fromJson(x))),
      languagesIds: List<String>.from(json['languages_ids'].map((x) => x)),
      manualCpc: json['manual_cpc'],
      isActive: json['is_active'],
      isDelete: json['is_delete'],
      customerConversionGoals: List<CustomerConversionGoal>.from(
          json['customer_conversion_goals']
              .map((x) => CustomerConversionGoal.fromJson(x))),
    );
  }
}

class Call {
  final String countryCode;
  final String phoneNumber;

  Call({
    required this.countryCode,
    required this.phoneNumber,
  });

  factory Call.fromJson(Map<String, dynamic> json) {
    return Call(
      countryCode: json['country_code'],
      phoneNumber: json['phone_number'],
    );
  }
}

class LocationId {
  final String location;
  final String geoTargetConstant;

  LocationId({
    required this.location,
    required this.geoTargetConstant,
  });

  factory LocationId.fromJson(Map<String, dynamic> json) {
    return LocationId(
      location: json['location'],
      geoTargetConstant: json['geoTargetConstant'],
    );
  }
}

class CustomerConversionGoal {
  CustomerConversionGoal();

  factory CustomerConversionGoal.fromJson(Map<String, dynamic> json) {
    return CustomerConversionGoal();
  }
}

class AdsAndGroups {
  final AdGroup adGroup;
  final List<Ad> ads;
  final List<Keyword> keywords;

  AdsAndGroups({
    required this.adGroup,
    required this.ads,
    required this.keywords,
  });

  factory AdsAndGroups.fromJson(Map<String, dynamic> json) {
    return AdsAndGroups(
      adGroup: AdGroup.fromJson(json['ad_group']),
      ads: List<Ad>.from(json['ads'].map((x) => Ad.fromJson(x))),
      keywords:
          List<Keyword>.from(json['keywords'].map((x) => Keyword.fromJson(x))),
    );
  }
}

class AdGroup {
  final String id;
  final String googleAdsAccountId;
  final String campaignId;
  final int cpcBidMicros;
  final String adGroupName;
  final String status;
  final bool isActive;
  final bool isDelete;
  final String adGroupId;

  AdGroup({
    required this.id,
    required this.googleAdsAccountId,
    required this.campaignId,
    required this.cpcBidMicros,
    required this.adGroupName,
    required this.status,
    required this.isActive,
    required this.isDelete,
    required this.adGroupId,
  });

  factory AdGroup.fromJson(Map<String, dynamic> json) {
    return AdGroup(
      id: json['_id'],
      googleAdsAccountId: json['googleads_account_id'],
      campaignId: json['campaign_id'],
      cpcBidMicros: json['cpc_bid_micros'],
      adGroupName: json['ad_group_name'],
      status: json['status'],
      isActive: json['is_active'],
      isDelete: json['is_delete'],
      adGroupId: json['ad_group_id'],
    );
  }
}

class Ad {
  final String googleAdsAccountId;
  final String adGroupId;
  final String status;
  final String finalUrls;
  final HeadlinesDescriptions headlinesDescription;
  final String path1;
  final String path2;
  final bool isActive;
  final bool isDelete;
  final String adId;

  Ad({
    required this.googleAdsAccountId,
    required this.adGroupId,
    required this.status,
    required this.finalUrls,
    required this.headlinesDescription,
    required this.path1,
    required this.path2,
    required this.isActive,
    required this.isDelete,
    required this.adId,
  });

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      googleAdsAccountId: json['googleads_account_id'],
      adGroupId: json['ad_group_id'],
      status: json['status'],
      finalUrls: json['final_urls'],
      headlinesDescription:
          HeadlinesDescriptions.fromJson(json['headlines_description']),
      path1: json['path1'],
      path2: json['path2'],
      isActive: json['is_active'],
      isDelete: json['is_delete'],
      adId: json['ad_id'],
    );
  }
}

class HeadlinesDescriptions {
  final List<Headline> headlineList;
  final List<Description> listOfDescription;
  // final List<PinnedDescription> pinnedDescriptions;
  // final List<PinnedHeadline> pinnedHeadlines;

  HeadlinesDescriptions({
    required this.headlineList,
    required this.listOfDescription,
    // required this.pinnedDescriptions,
    // required this.pinnedHeadlines,
  });

  factory HeadlinesDescriptions.fromJson(Map<String, dynamic> json) {
    return HeadlinesDescriptions(
      headlineList: List<Headline>.from(
          json['headline_list'].map((x) => Headline.fromJson(x))),
      listOfDescription: List<Description>.from(
          json['list_of_discription'].map((x) => Description.fromJson(x))),
      // pinnedDescriptions: List<PinnedDescription>.from(
      //     json['pinned_descriptions']
      //         .map((x) => PinnedDescription.fromJson(x))),
      // pinnedHeadlines: List<PinnedHeadline>.from(
      //     json['pinned_headlines'].map((x) => PinnedHeadline.fromJson(x))),
    );
  }
}

class Headline {
  final String text;
  final String? position;

  Headline({
    required this.text,
    this.position,
  });



  factory Headline.fromJson(Map<String, dynamic> json) {
    return Headline(
      text: json['text'],
      position: json['position'],
    );
  }
}

class Description {
  final String text;
  final String? position;

  Description({
    required this.text,
    this.position,
  });

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      text: json['text'],
      position: json['position'],
    );
  }
}

class Keyword {
  final String id;
  final String googleAdsAccountId;
  final String adGroupId;
  final String keywordText;
  final String matchType;
  final String cpc;
  final String status;
  final bool isActive;
  final bool isDelete;
  final bool isNegative;
  final String keywordId;

  Keyword({
    required this.id,
    required this.googleAdsAccountId,
    required this.adGroupId,
    required this.keywordText,
    required this.matchType,
    required this.cpc,
    required this.status,
    required this.isActive,
    required this.isDelete,
    required this.isNegative,
    required this.keywordId,
  });

  factory Keyword.fromJson(Map<String, dynamic> json) {
    return Keyword(
      id: json['_id'],
      googleAdsAccountId: json['googleads_account_id'],
      adGroupId: json['ad_group_id'],
      keywordText: json['keyword_text'],
      matchType: json['match_type'],
      cpc: json['cpc'].toString(),
      status: json['status'],
      isActive: json['is_active'],
      isDelete: json['is_delete'],
      isNegative: json['is_negative'],
      keywordId: json['keyword_id'],
    );
  }
}

class CustomerObj {
  final String name;
  final String email;
  final String phoneNo;
  final String country;
  final String language;
  final String passwdHash;
  final String googleAdsAccountId;
  final String companyName;
  final String category;
  final String website;
  final String location;
  final List<dynamic> googlePhoneNumbers;
  final String otp;
  final bool isActive;
  final String registeredBy;
  final String role;
  final bool isManager;
  final bool isPermission;

  CustomerObj({
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.country,
    required this.language,
    required this.passwdHash,
    required this.googleAdsAccountId,
    required this.companyName,
    required this.category,
    required this.website,
    required this.location,
    required this.googlePhoneNumbers,
    required this.otp,
    required this.isActive,
    required this.registeredBy,
    required this.role,
    required this.isManager,
    required this.isPermission,
  });

  factory CustomerObj.fromJson(Map<String, dynamic> json) {
    return CustomerObj(
      name: json['name'],
      email: json['email'],
      phoneNo: json['phone_no'],
      country: json['country'],
      language: json['language'],
      passwdHash: json['passwd_hash'],
      googleAdsAccountId: json['googleads_account_id'],
      companyName: json['company_name'],
      category: json['category'],
      website: json['website'],
      location: json['location'],
      googlePhoneNumbers: json['google_phone_numbers'],
      otp: json['otp'],
      isActive: json['is_active'],
      registeredBy: json['registered_by'],
      role: json['role'],
      isManager: json['is_manager'],
      isPermission: json['is_permission'],
    );
  }
}
