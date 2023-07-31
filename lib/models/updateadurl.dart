class UpdateUrl {
  String? adId;
  String? url;
  String? path1;
  String? path2;

  UpdateUrl(
      {required this.adId,
      required this.url,
      required this.path1,
      required this.path2});

  UpdateUrl.fromJson(Map<String, dynamic> json) {
    adId = json['ad_id'];
    url = json['url'];
    path1 = json['path1'];
    path2 = json['path2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['ad_id'] = adId;
    data['url'] = url;
    data['path1'] = path1;
    data['path2'] = path2;
    return data;
  }
}
