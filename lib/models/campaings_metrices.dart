class CampainMetrix {
  String? time;

  CampainMetrix({required this.time});

  CampainMetrix.fromJson(Map<String, dynamic> json) {
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['time'] = time;
    return data;
  }
}
