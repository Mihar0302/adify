// ignore_for_file: prefer_collection_literals, unnecessary_this



class Syggestions {
  String? businessName;
  String? businessCategory;

  Syggestions({this.businessName, this.businessCategory});

  Syggestions.fromJson(Map<String, dynamic> json) {
    businessName = json['business_name'];
    businessCategory = json['business_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['business_name'] = this.businessName;
    data['business_category'] = this.businessCategory;
    return data;
  }
}

class Suggestionmpodel {
  List<Descriptionmodel> description;
  List<Headlinemodel> headlines;

  Suggestionmpodel({required this.description, required this.headlines});

  factory Suggestionmpodel.fromJson(Map<String, dynamic> json) {
    List<Descriptionmodel> descriptionList = [];
    if (json['description'] != null) {
      for (var item in json['description']) {
        Descriptionmodel description = Descriptionmodel.fromJson(item);
        descriptionList.add(description);
      }
    }

    List<Headlinemodel> headlineList = [];
    if (json['headlines'] != null) {
      for (var item in json['headlines']) {
        Headlinemodel headline = Headlinemodel.fromJson(item);
        headlineList.add(headline);
      }
    }

    return Suggestionmpodel(
      description: descriptionList,
      headlines: headlineList,
    );
  }
}

class Descriptionmodel {
  String text = "";
  String position = "";

  Descriptionmodel({required this.text, required this.position});

  factory Descriptionmodel.fromJson(Map<String, dynamic> json) {
    return Descriptionmodel(
      text: json['text'],
      position: json['position'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'position': position,
    };
  }
}

class Headlinemodel {
  String text;
  String position;

  Headlinemodel({required this.text, required this.position});

  factory Headlinemodel.fromJson(Map<String, dynamic> json) {
    return Headlinemodel(
      text: json['text'],
      position: json['position'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'position': position,
    };
  }
}

// class Suggestionmodel {
//   List<HeadlineList> headlines;
//   List<ListOfDiscription> description;
//
//   Suggestionmodel({required this.description, required this.headlines});
//
//   factory Suggestionmodel.fromJson(Map<String, dynamic> json) {
//     return Suggestionmodel(
//       headlines: List<HeadlineList>.from(
//           json['headline_list'].map((x) => HeadlineList.fromJson(x))),
//       description: List<ListOfDiscription>.from(json['list_of_discription']
//           .map((x) => ListOfDiscription.fromJson(x))),
//     );
//   }
// }
