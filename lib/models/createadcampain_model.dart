// ignore_for_file: non_constant_identifier_names, camel_case_types


import 'package:adify/models/suggestmodal.dart';

class CreateAds {
  final String business_name;
  final String landing_url;
  final String language_code;
  final String country_code;
  final String phone_number;
  final int budget;
  final String group_name;
  final bool manual_cpc;
  final String path2;
  final String path1;
  final bool target_search_network;
  final bool target_partner_search_network;
  final bool target_content_network;
  final List<Positivekeywords> positive_keywords;
  final List<Negativekeywords> negative_keywords;
  final String max_cpc;
  final List location_ids;
  final List language_ids;
  final int bidding_strategy_cost;
  final String campaign_name;
  final String bidding_strategy_name;
  final Map headlines_description;

  CreateAds({
    required this.business_name,
    required this.landing_url,
    required this.language_code,
    required this.country_code,
    required this.phone_number,
    required this.budget,
    required this.group_name,
    required this.manual_cpc,
    required this.path2,
    required this.path1,
    required this.target_search_network,
    required this.target_partner_search_network,
    required this.target_content_network,
    required this.positive_keywords,
    required this.negative_keywords,
    required this.max_cpc,
    required this.location_ids,
    required this.language_ids,
    required this.bidding_strategy_cost,
    required this.campaign_name,
    required this.bidding_strategy_name,
    required this.headlines_description,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['business_name'] = business_name;
    data['landing_url'] = landing_url;
    data['language_code'] = language_code;
    data['country_code'] = country_code;
    data['phone_number'] = phone_number;
    data['budget'] = budget;
    data['group_name'] = group_name;
    data['manual_cpc'] = manual_cpc;
    data['path2'] = path2;
    data['path1'] = path1;
    data['target_search_network'] = target_search_network;
    data['target_partner_search_network'] = target_partner_search_network;
    data['target_content_network'] = target_content_network;
    data['positive_keywords'] = positive_keywords;
    data['negative_keywords'] = negative_keywords;
    data['max_cpc'] = max_cpc;
    data['location_ids'] = location_ids;
    data['language_ids'] = language_ids;
    data['bidding_strategy_cost'] = bidding_strategy_cost;
    data['campaign_name'] = campaign_name;
    data['bidding_strategy_name'] = bidding_strategy_name;
    data['headlines_description'] = headlines_description;
    return data;
  }
}

class Positivekeywords {
  final String keyword_text;
  final int max_cpc;
  final String match_type;

  Positivekeywords({
    required this.keyword_text,
    required this.max_cpc,
    required this.match_type,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['keyword_text'] = keyword_text;
    data['max_cpc'] = max_cpc;
    data['match_type'] = match_type;

    return data;
  }
}

class Negativekeywords {
  final String keyword_text;
  final String match_type;

  Negativekeywords({
    required this.keyword_text,
    required this.match_type,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['keyword_text'] = keyword_text;
    data['match_type'] = match_type;

    return data;
  }
}

class LocationIds {
  final String location;
  final String geoTargetConstant;

  LocationIds({
    required this.location,
    required this.geoTargetConstant,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['location'] = location;
    data['geoTargetConstant'] = geoTargetConstant;

    return data;
  }
}

class HeadlinesDescription {
  final List<Headlinemodel> headline_list;
  final List<Descriptionmodel> list_of_discription;
  final List? pinned_descriptions;
  final List? pinned_headlines;

  HeadlinesDescription({
    required this.headline_list,
    required this.list_of_discription,
    required this.pinned_descriptions,
    required this.pinned_headlines,
  });

  factory HeadlinesDescription.fromJson(Map<String, dynamic> json) {
    return HeadlinesDescription(
      pinned_descriptions: json['pinned_descriptions'],
      headline_list: json['headline_list'],
      list_of_discription: json['list_of_discription'],
      pinned_headlines: json['pinned_headlines'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['headline_list'] = headline_list;
    data['list_of_discription'] = list_of_discription;
    data['pinned_descriptions'] = pinned_descriptions;
    data['pinned_headlines'] = pinned_headlines;
    return data;
  }
}

class HeadlineList {
  String? text;
  String? position;

  HeadlineList({
    required this.text,
    required this.position,
  });

  HeadlineList.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['position'] = position;
    return data;
  }
}

class ListOfDiscription {
  String? text;
  String? position;

  ListOfDiscription({required this.text, required this.position});

  ListOfDiscription.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['position'] = position;
    return data;
  }
}

class PinnedHeadlines {
  List<PinnedHeadlines1>? pinned_headlines1;
  List<PinnedHeadlines2>? pinned_headlines2;
  List<PinnedHeadlines3>? pinned_headlines3;

  PinnedHeadlines(
      {required this.pinned_headlines1,
      required this.pinned_headlines2,
      required this.pinned_headlines3});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['pinned_headlines1'] = pinned_headlines1;
    data['pinned_headlines1'] = pinned_headlines2;
    data['pinned_headlines1'] = pinned_headlines3;

    return data;
  }
}

class PinnedHeadlines1 {
  String? text;
  String? position;

  PinnedHeadlines1({required this.text, required this.position});

  PinnedHeadlines1.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['position'] = position;
    return data;
  }
}

class PinnedHeadlines2 {
  String? text;
  String? position;

  PinnedHeadlines2({required this.text, required this.position});

  PinnedHeadlines2.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['position'] = position;
    return data;
  }
}

class PinnedHeadlines3 {
  String? text;
  String? position;

  PinnedHeadlines3({required this.text, required this.position});

  PinnedHeadlines3.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['position'] = position;
    return data;
  }
}

class PinnedDescriptions {
  List<pinneddescription1>? pinned_headlines1;
  List<pinneddescription2>? pinned_headlines2;

  PinnedDescriptions(
      {required this.pinned_headlines1, required this.pinned_headlines2});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pinned_headlines1'] = pinned_headlines1;
    data['pinned_headlines2'] = pinned_headlines2;
    return data;
  }
}

class pinneddescription1 {
  String? text;
  String? position;

  pinneddescription1({required this.text, required this.position});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['position'] = position;
    return data;
  }
}

class pinneddescription2 {
  String? text;
  String? position;

  pinneddescription2({required this.text, required this.position});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['position'] = position;
    return data;
  }
}
