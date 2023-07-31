class KeywordmetriX {
  String? time;

  KeywordmetriX({required this.time});

  KeywordmetriX.fromJson(Map<String, dynamic> json) {
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['time'] = time;
    return data;
  }
}
