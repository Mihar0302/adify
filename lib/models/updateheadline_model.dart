// import 'createadcampain_model.dart';
//
// // class Updateheadlines {
// //   String? adId;
// //   String? campaignName;
// //   List<String>? headlineList;
// //   List<String>? listOfDiscription;
// //   List<dynamic>? pinnedHeadlines;
// //   String? headlinesDescription;
// //
// //   Updateheadlines(
// //       {required this.adId,
// //       required this.campaignName,
// //       required this.headlineList,
// //       required this.listOfDiscription,
// //       required this.pinnedHeadlines,
// //       required this.headlinesDescription});
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     data['ad_id'] = adId;
// //     data['campaign_name'] = campaignName;
// //     data['headline_list'] = headlineList;
// //     data['list_of_discription'] = listOfDiscription;
// //     data['pinned_headlines'] = pinnedHeadlines;
// //     data['headlines_description'] = headlinesDescription;
// //     return data;
// //   }
// // }
//
// class Updateheadlines {
//   String? adId;
//   HeadlinesDescription? headlinesDescription;
//
//   Updateheadlines({required this.adId, required this.headlinesDescription});
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['ad_id'] = adId;
//     data['headlines_description'] = headlinesDescription!.toJson();
//     return data;
//   }
// }
//
// class HeadlineList {
//   String? text;
//   String? position;
//
//   HeadlineList({required this.text, required this.position});
//
//   HeadlineList.fromJson(Map<String, dynamic> json) {
//     text = json['text'];
//     position = json['position'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['text'] = text;
//     data['position'] = position;
//     return data;
//   }
// }
//
// class PinnedDescriptions {
//   List<PinnedDescription1>? pinnedDescription1;
//   List<PinnedDescription2>? pinnedDescription2;
//
//   PinnedDescriptions(
//       {required this.pinnedDescription1, required this.pinnedDescription2});
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//
//     data['pinned_description1'] = pinnedDescription1;
//
//     data['pinned_description2'] = pinnedDescription2;
//
//     return data;
//   }
// }
//
// class PinnedDescription2 {
//   String? text;
//   String? position;
//
//   PinnedDescription2({required this.text, required this.position});
//
//   PinnedDescription2.fromJson(Map<String, dynamic> json) {
//     text = json['text'];
//     position = json['position'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['text'] = text;
//     data['position'] = position;
//     return data;
//   }
// }
//
// class PinnedDescription1 {
//   String? text;
//   String? position;
//
//   PinnedDescription1({required this.text, required this.position});
//
//   PinnedDescription1.fromJson(Map<String, dynamic> json) {
//     text = json['text'];
//     position = json['position'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['text'] = text;
//     data['position'] = position;
//     return data;
//   }
// }
//
// class PinnedHeadlines {
//   List<PinnedHeadlines1>? pinnedHeadlines1;
//   List<PinnedHeadlines2>? pinnedHeadlines2;
//   List<PinnedHeadlines3>? pinnedHeadlines3;
//
//   PinnedHeadlines(
//       {required this.pinnedHeadlines1,
//       required this.pinnedHeadlines2,
//       required this.pinnedHeadlines3});
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//
//     data['pinned_headlines1'] = pinnedHeadlines1;
//
//     data['pinned_headlines2'] = pinnedHeadlines2;
//
//     data['pinned_headlines3'] = this.pinnedHeadlines3;
//
//     return data;
//   }
// }
// ignore_for_file: unused_import, unnecessary_this, prefer_collection_literals

import 'dart:convert';

import 'createadcampain_model.dart';

class Updateheadline {
  String adId;
  HeadlinesDescription headlinesDescription;

  Updateheadline({
    required this.adId,
    required this.headlinesDescription,
  });

  factory Updateheadline.fromJson(Map<String, dynamic> json) {
    return Updateheadline(
      adId: json['ad_id'],
      headlinesDescription:
          HeadlinesDescription.fromJson(json['headlines_description']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ad_id'] = this.adId;
    data['headlines_description'] = this.headlinesDescription.toJson();
    return data;
  }
}
