// ignore_for_file: unnecessary_this

class SugBudget {
  String? businessName;
  String? landingUrl;
  String? languageCode;
  String? geoTargetConstant;
  String? countryCode;

  SugBudget(
      {required this.businessName,
      required this.landingUrl,
      required this.languageCode,
      required this.geoTargetConstant,
      required this.countryCode});

  SugBudget.fromJson(Map<String, dynamic> json) {
    businessName = json['business_name'];
    landingUrl = json['landing_url'];
    languageCode = json['language_code'];
    geoTargetConstant = json['geo_target_constant'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['business_name'] = this.businessName;
    data['landing_url'] = this.landingUrl;
    data['language_code'] = this.languageCode;
    data['geo_target_constant'] = this.geoTargetConstant;
    data['country_code'] = this.countryCode;
    return data;
  }
}
