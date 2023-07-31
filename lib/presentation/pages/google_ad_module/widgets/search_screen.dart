// import 'package:chat_box/data/controller/globle_controller.dart';
// import 'package:chat_box/presentation/screen/user_screen.dart';
// import 'package:chat_box/utils/app_list.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/get_navigation/get_navigation.dart';
//
// import '../../utils/app_color.dart';
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   GlobalController global = Get.find();
//
//   @override
//   void initState() {
//     super.initState();
//     for (int i = 0; i < AppList.newUser.length; i++) {
//       debugPrint(AppList.newUser[i]['data1']);
//       global.filteredList.add(
//         AppList.newUser[i]['data1'],
//       );
//       global.fooList = global.filteredList;
//     }
//     setState(() {});
//   }
//
//   void filter(String inputString) {
//     global.fooList = global.filteredList
//         .where((i) => i.toLowerCase().contains(inputString))
//         .toList();
//     debugPrint("==========>filter<==========${global.fooList}");
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             SizedBox(
//               height: Get.height * 0.05,
//             ),
//             TextField(
//               controller: global.searchController,
//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 15),
//                 hintText: "Search",
//                 suffixIcon: const Icon(Icons.search),
//                 // prefix: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                   borderSide: const BorderSide(),
//                 ),
//               ),
//               onChanged: (text) {
//                 text = text.toLowerCase();
//                 debugPrint("==========>text<==============$text");
//                 filter(text);
//                 setState(() {});
//               },
//             ),
//             global.searchController.text.isNotEmpty
//                 ? Expanded(
//                     child: ListView.builder(
//                       itemCount: global.fooList.length,
//                       itemBuilder: (BuildContext context, int index) => Card(
//                         elevation: 1,
//                         margin: const EdgeInsets.symmetric(vertical: 2),
//                         child: ListTile(
//                           contentPadding:
//                               const EdgeInsets.symmetric(horizontal: 25),
//                           leading: Image.asset(AppList.newUser[index]["botam"]),
//                           title: Text(global.fooList[index],
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.w500)),
//                           subtitle: Text(
//                             AppList.newUser[index]["data2"],
//                             style: TextStyle(
//                                 color: AppColor.black10, fontSize: 12),
//                           ),
//                           onTap: () {
//                             debugPrint(
//                                 "========add____----${global.fooList[index]}");
//
//                             global.history.add(
//                               {
//                                 "data1": global.fooList[index],
//                                 "data2": AppList.newUser[index]["data2"],
//                                 "data3": AppList.newUser[index]["botam"],
//                               },
//                             );
//                             Get.to(
//                               UserScreen(
//                                 dataone: AppList.newUser[index]["botam"],
//                                 datatwo: global.fooList[index],
//                               ),
//                             );
//                             global.fooList.clear();
//                             setState(() {});
//                           },
//                         ),
//                       ),
//                     ),
//                   )
//                 : Expanded(
//                     child: ListView.builder(
//                       itemCount: global.history.length,
//                       itemBuilder: (BuildContext context, int index) => Card(
//                         elevation: 1,
//                         margin: const EdgeInsets.symmetric(vertical: 2),
//                         child: ListTile(
//                           trailing: CloseButton(
//                             onPressed: () {
//                               global.history.removeAt(index);
//                               setState(() {});
//                             },
//                           ),
//                           contentPadding:
//                               const EdgeInsets.symmetric(horizontal: 25),
//                           title: Text(
//                             global.history[index]["data1"],
//                             style: const TextStyle(fontWeight: FontWeight.w500),
//                           ),
//                           leading: Image.asset(global.history[index]["data3"]),
//                           subtitle: Text(
//                             global.history[index]["data2"],
//                             style: TextStyle(
//                                 color: AppColor.black10, fontSize: 12),
//                           ),
//                           onTap: () {
//                             Get.to(
//                               UserScreen(
//                                 dataone: global.history[index]["data3"],
//                                 datatwo: global.history[index]["data1"],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   )
//           ],
//         ),
//       ),
//     );
//   }
// }
