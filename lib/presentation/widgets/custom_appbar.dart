import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final Size size;
  final bool campaing;
  final bool columnShow;
  final Widget? widget;
  final bool widgetShow;
  final Function onClick;
  final int index;
  final String mainLabel;
  final String dayCount;

  const CustomAppbar({
    Key? key,
    required this.size,
    this.campaing = false,
    this.columnShow = false,
    this.widget,
    this.widgetShow = false,
    required this.onClick,
    this.index = 0,
    this.mainLabel = "",
    this.dayCount = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.white,
      padding: EdgeInsets.only(
          top: campaing ? MediaQuery.of(context).padding.top + 20 : 20,
          bottom: campaing ? 15 : 0,
          left: size.width * 0.04,
          right: size.width * 0.04),
      child: campaing
          ? Row(
              children: [
                InkWell(
                  onTap: () {
                    onClick();
                  },
                  child: Image.asset(
                    AppImages.arrowRight,
                    height: size.height * 0.031,
                  ),
                ),
                Expanded(child: Container()),
                columnShow
                    ? Column(
                        children: [
                          Text(
                            mainLabel,
                            style: TextStyle(
                              letterSpacing: 0.34,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.042,
                            ),
                          ),
                          Text(
                            dayCount,
                            style: TextStyle(
                              letterSpacing: 0.34,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grey,
                              fontSize: size.width * 0.034,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        mainLabel,
                        style: TextStyle(
                          letterSpacing: 0.34,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.042,
                        ),
                      ),
                Expanded(child: Container()),
                widgetShow ? widget! : const SizedBox(),
              ],
            )
          : Row(
              children: [
                InkWell(
                  onTap: () {
                    onClick();
                  },
                  child: Image.asset(
                    AppImages.logo,
                    height: size.height * 0.1,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                Text(
                  mainLabel,
                  style: TextStyle(
                    letterSpacing: 0.34,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.042,
                  ),
                ),
                Expanded(child: Container()),
                widgetShow ? widget! : const SizedBox(),
              ],
            ),
    );
  }
}
