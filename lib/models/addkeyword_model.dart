class Addkeyword {
  String? adGroupId;
  String? keywordText;
  String? matchType;

  Addkeyword(
      {required this.adGroupId,
      required this.keywordText,
      required this.matchType});

  Addkeyword.fromJson(Map<String, dynamic> json) {
    adGroupId = json['ad_group_id'];
    keywordText = json['keyword_text'];
    matchType = json['match_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ad_group_id'] = adGroupId;
    data['keyword_text'] = keywordText;
    data['match_type'] = matchType;
    return data;
  }
}
