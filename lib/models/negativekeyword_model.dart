class AddNegative {
  String? adGroupId;
  String? keywordText;
  String? matchType;
  String? nagetive;

  AddNegative(
      {required this.adGroupId,
      required this.nagetive,
      required this.keywordText,
      required this.matchType});

  AddNegative.fromJson(Map<String, dynamic> json) {
    adGroupId = json['ad_group_id'];
    keywordText = json['keyword_text'];
    matchType = json['match_type'];
    nagetive = json['negative'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ad_group_id'] = adGroupId;
    data['keyword_text'] = keywordText;
    data['match_type'] = matchType;
    data['negative'] = nagetive;
    return data;
  }
}
