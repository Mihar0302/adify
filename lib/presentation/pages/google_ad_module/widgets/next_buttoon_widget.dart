import 'package:adify/controller/global_controller.dart';
import 'package:adify/presentation/widgets/custom_btn.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:flutter/material.dart';

class NextButtonWidget extends StatelessWidget {
  final String title;
  final Function onClick;
  final GlobalController globalController;
  final Size size;

  const NextButtonWidget({
    Key? key,
    required this.title,
    required this.globalController,
    required this.onClick,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBtn(
        margin: true,
        size: size,
        iconShow: false,
        customWidget: true,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                letterSpacing: 0.34,
                color: AppColor.white,
                fontSize: size.width * 0.04,
              ),
            ),
            SizedBox(width: size.width * 0.03),
            Image.asset(
              AppImages.right,
              color: AppColor.white,
              height: size.height * 0.034,
            )
          ],
        ),
        onClick: onClick);
  }
}
