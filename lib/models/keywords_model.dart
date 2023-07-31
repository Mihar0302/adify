class KeywordsPostData {
  final String businessName;
  final String landingUrl;
  final String languageCode;
  final String geoTargetConstant;
  final String countryCode;

  KeywordsPostData({
    required this.businessName,
    required this.landingUrl,
    required this.languageCode,
    required this.geoTargetConstant,
    required this.countryCode,
  });

  Map toJson() => {
        "business_name": businessName,
        "landing_url": landingUrl,
        "language_code": languageCode,
        "geo_target_constant": geoTargetConstant,
        "country_code": countryCode,
      };
}
