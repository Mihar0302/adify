import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_image.dart';
import 'custom_column_text.dart';

class CustomReportContainer extends StatelessWidget {
  final Size size;
  final String firstText;
  final String secondText;
  final String threeText;
  final String fourText;
  final bool activeAndPaused;
  final Widget widget;
  final bool changes;
  final Function onClick;
  final bool nextShow;

  const CustomReportContainer({
    Key? key,
    required this.size,
    required this.firstText,
    required this.secondText,
    required this.threeText,
    required this.fourText,
    this.activeAndPaused = false,
    required this.widget,
    this.changes = false,
    required this.onClick,
    this.nextShow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            onClick();
          },
          child: Container(
            width: size.width,
            margin: EdgeInsets.only(
                left: size.width * 0.05,
                right: size.width * 0.05,
                bottom: size.height * 0.03),
            padding: EdgeInsets.only(
              right: size.width * 0.05,
              left: size.width * 0.05,
              bottom: nextShow ? size.height * 0.02 : size.height * 0.03,
              top: size.height * 0.02,
            ),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widget,
                nextShow
                    ? SizedBox(height: size.height * 0.007)
                    : SizedBox(height: size.height * 0.02),
                changes
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomColumnText(
                              size: size, label: "Impr", points: firstText),
                          CustomColumnText(
                              size: size, label: "Click", points: secondText),
                          CustomColumnText(
                              size: size,
                              label: "Conversation",
                              points: threeText),
                          CustomColumnText(
                              size: size, label: "Cost", points: fourText),
                          SizedBox(width: size.width * 0.02),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomColumnText(
                              size: size, label: "Click", points: firstText),
                          CustomColumnText(
                              size: size, label: "Impr.", points: secondText),
                          CustomColumnText(
                              size: size, label: "Clicks", points: threeText),
                          CustomColumnText(
                              size: size, label: "Avg CPC", points: fourText),
                          SizedBox(width: size.width * 0.02),
                        ],
                      )
              ],
            ),
          ),
        ),
        nextShow
            ? Container()
            : Positioned(
                top: 0,
                bottom: 22,
                right: 0,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.secondaryColor,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.025),
                        Image.asset(AppImages.right),
                      ],
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
