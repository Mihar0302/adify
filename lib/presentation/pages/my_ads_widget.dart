import 'package:adify/utils/app_color.dart';
import 'package:flutter/material.dart';

import 'package:adify/presentation/widgets/custom_report_container.dart';
import 'package:adify/utils/app_image.dart';

import '../../utils/route_string.dart';
import '../widgets/custom_appbar.dart';

class MyAdsWidget extends StatelessWidget {
  final Size size;

  const MyAdsWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppbar(
            mainLabel: "MY ADS",
            columnShow: false,
            campaing: true,
            widgetShow: true,
            onClick: () {},
            size: size,
            widget: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteString.EDIT_ADS);
                  },
                  child: Image.asset(AppImages.editing,
                      height: size.height * 0.028),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.01),
          ListView.builder(
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, int i) {
              return CustomReportContainer(
                changes: true,
                size: size,
                firstText: "23",
                secondText: "23",
                threeText: "23",
                fourText: "23",
                // widget: Row(
                //   children: [
                //     Text(
                //       "Google",
                //       style: TextStyle(
                //         letterSpacing: 0.34,
                //         fontWeight: FontWeight.w500,
                //         fontSize: size.width * 0.044,
                //       ),
                //     ),
                //   ],
                // ),
                widget: Image.asset(
                  AppImages.google3,
                  height: size.height * 0.065,
                ),
                onClick: () {
                  Navigator.pushNamed(context, RouteString.MY_CAMPAIGN_SCREEN);
                },
              );
            },
          ),
          // const Spacer(),
          SizedBox(height: size.height * 0.01),

          TextButton(
            onPressed: () {},
            child: Text(
              'Back to homescreen ',
              style: TextStyle(
                letterSpacing: 0.3,
                color: AppColor.textGreyColor,
                fontWeight: FontWeight.w500,
                fontSize: size.height * 0.021,
              ),
            ),
          )
        ],
      ),
    );
  }
}
            //   Stack(
            //   children: [
            //     InkWell(
            //       onTap: () {
            //         Navigator.pushNamed(
            //             context, RouteString.MY_CAMPAIGN_SCREEN);
            //       },
            //       child: Container(
            //         width: size.width,
            //         margin: EdgeInsets.only(
            //             left: size.width * 0.05,
            //             right: size.width * 0.05,
            //             bottom: size.height * 0.03),
            //         padding: EdgeInsets.only(
            //           right: size.width * 0.05,
            //           left: size.width * 0.05,
            //           bottom: size.height * 0.03,
            //           top: size.height * 0.02,
            //         ),
            //         decoration: BoxDecoration(
            //           color: AppColor.white,
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           children: [
            //             Text(
            //               "Google",
            //               style: TextStyle(

            //                 fontWeight: FontWeight.w500,
            //                 fontSize: size.width * 0.044,
            //               ),
            //             ),
            //             SizedBox(height: size.height * 0.02),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 CustomColumnText(
            //                     size: size, label: "Impr", points: "75"),
            //                 CustomColumnText(
            //                     size: size, label: "Click", points: "75"),
            //                 CustomColumnText(
            //                     size: size,
            //                     label: "Conversation",
            //                     points: "75"),
            //                 CustomColumnText(
            //                     size: size, label: "Cost", points: "75"),
            //                 SizedBox(width: size.width * 0.02),
            //               ],
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //     Positioned(
            //       top: 0,
            //       bottom: 0,
            //       right: 0,
            //       child: InkWell(
            //         onTap: () {},
            //         child: Container(
            //           height: 40,
            //           width: 40,
            //           decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             color: AppColor.secondaryColor,
            //           ),
            //           child: Row(
            //             children: [
            //               SizedBox(width: size.width * 0.025),
            //               Image.asset(AppImages.right),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // );
