class Callads {
  String? phoneNumber;
  String? phoneCountry;
  String? campaignId;

  Callads(
      {required this.phoneNumber,
      required this.phoneCountry,
      required this.campaignId});

  Callads.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    phoneCountry = json['phone_country'];
    campaignId = json['campaign_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    data['phone_country'] = phoneCountry;
    data['campaign_id'] = campaignId;
    return data;
  }
}
