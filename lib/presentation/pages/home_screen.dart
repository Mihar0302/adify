import 'package:adify/controller/add_keywords_controller.dart';
import 'package:adify/presentation/pages/ads_groups_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adify/controller/global_controller.dart';
import 'package:adify/presentation/pages/home_widget.dart';
import 'package:adify/presentation/widgets/custom_bottom_bar.dart';
import 'package:adify/utils/app_color.dart';
import 'billing_module/payment_screen.dart';
import 'my_campaign_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AddKeywordsController addKeywordsController =
      Get.put(AddKeywordsController());
  final GlobalController global = Get.find();

  @override
  void initState() {
    addKeywordsController.categoryApiCall();
    addKeywordsController.CampainmetriXApicall(time: "TODAY");
    addKeywordsController.Keyworsmetrixapicall(time: "TODAY");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Expanded(
              child: global.tabIndex.value == 0
                  ? HomeWidget(size: size)
                  : global.tabIndex.value == 1
                      ? const MyCampaignScreen()
                      : global.tabIndex.value == 2
                          ? const AdsGroupsScreen()
                          : global.tabIndex.value == 3
                              ? const PaymentScreen()
                              : Container(),
            ),
          ),
          Obx(
            () => CustomBottomBar(
              size: size,
              funcOne: () {
                global.tabIndex.value = 0;
              },
              funcTwo: () {
                global.tabIndex.value = 1;
              },
              funcThree: () {
                global.tabIndex.value = 2;
              },
              fucFour: () {
                global.tabIndex.value = 3;
              },
              index: global.tabIndex.value,
            ),
          ),
        ],
      ),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final GlobalController global = Get.put(GlobalController());

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: AppColor.scaffoldBackColor,
//       body: Column(
//         children: [
//           Obx(
//             () => CustomAppbar(
//               mainLabel: "MY ADS",
//               columnShow: false,
//               campaing: true,
//               widgetShow: true,
//               onClick: () {},
//               size: size,
//               widget: global.tabIndex.value == 0
//                   ? Row(
//                       children: [
//                         InkWell(
//                           onTap: () {},
//                           child: Image.asset(AppImages.help_circle,
//                               height: size.height * 0.028),
//                         ),
//                         SizedBox(width: size.width * 0.03),
//                         InkWell(
//                           onTap: () {},
//                           child: Image.asset(
//                             AppImages.bell,
//                             height: size.height * 0.027,
//                           ),
//                         ),
//                       ],
//                     )
//                   : Row(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(context, RouteString.EDIT_ADS);
//                           },
//                           child: Image.asset(AppImages.editing,
//                               height: size.height * 0.028),
//                         ),
//                       ],
//                     ),
//             ),
//           ),
//           Expanded(
//             child: Obx(
//               () => global.tabIndex.value == 0
//                   ? HomeWidget(size: size)
//                   : global.tabIndex.value == 1
//                       ? MyAdsWidget(size: size)
//                       : Container(),
//             ),
//           ),
//           Obx(
//             () => CustomBottomBar(
//               size: size,
//               funcOne: () {
//                 global.tabIndex.value = 0;
//               },
//               funcTwo: () {
//                 global.tabIndex.value = 1;
//               },
//               funcThree: () {
//                 global.tabIndex.value = 2;
//               },
//               fucFour: () {
//                 global.tabIndex.value = 3;
//               },
//               index: global.tabIndex.value,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
