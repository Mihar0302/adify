import 'package:adify/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../../utils/app_image.dart';

class CustomBtn extends StatelessWidget {
  final Size size;
  final bool iconShow;
  final bool margin;
  final bool customWidget;
  final String btnName;
  final Widget? content;
  final Function onClick;

  const CustomBtn({
    Key? key,
    required this.size,
    required this.iconShow,
    this.btnName = '',
    required this.onClick,
    this.content,
    this.margin = true,
    this.customWidget = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        width: size.width,
        margin: margin
            ? EdgeInsets.symmetric(horizontal: size.width * 0.05)
            : const EdgeInsets.symmetric(horizontal: 0.0),
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.015, horizontal: size.width * 0.1),
        decoration: BoxDecoration(
          color: AppColor.btnColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: customWidget
            ? content
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconShow
                      ? Image.asset(
                          AppImages.google,
                          height: size.height * 0.034,
                        )
                      : Container(),
                  SizedBox(width: size.width * 0.02),
                  Text(
                    btnName,
                    style: TextStyle(
                        letterSpacing: 0.3,
                        color: AppColor.white,
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
      ),
    );
  }
}
