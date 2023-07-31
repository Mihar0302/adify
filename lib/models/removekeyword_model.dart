class Removekeyword {
  String? adGroupId;
  String? criterionId;

  Removekeyword({required this.adGroupId, required this.criterionId});

  Removekeyword.fromJson(Map<String, dynamic> json) {
    adGroupId = json['ad_group_id'];
    criterionId = json['criterion_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ad_group_id'] = adGroupId;
    data['criterion_id'] = criterionId;
    return data;
  }
}
