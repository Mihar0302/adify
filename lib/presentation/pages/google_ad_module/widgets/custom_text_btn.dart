// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.diamond, height: size.height * 0.026),
          SizedBox(width: size.width * 0.03),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  letterSpacing: 0.34,
                  color: AppColor.purpleColor,
                  fontSize: size.width * 0.04,
                ),
              ),
              SizedBox(width: size.width * 0.02),
              Image.asset(
                AppImages.right,
                color: AppColor.purpleColor,
                height: size.height * 0.034,
              )
            ],
          )
        ],
      ),
    );
  }
}
