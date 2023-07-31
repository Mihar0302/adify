// ignore_for_file: camel_case_types

class updatelocation {
  String? campaignId;
  List? locationId;

  updatelocation({required this.campaignId, required this.locationId});

  updatelocation.fromJson(Map<String, dynamic> json) {
    campaignId = json['campaign_id'];
    locationId = json['location_ids'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['campaign_id'] = campaignId;
    data['location_ids'] = locationId;
    return data;
  }
}
