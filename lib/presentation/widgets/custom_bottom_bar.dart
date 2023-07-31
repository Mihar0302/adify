import 'package:flutter/material.dart';

import '../../../../utils/app_image.dart';
import '../../utils/app_color.dart';

class CustomBottomBar extends StatelessWidget {
  final Size size;
  final Function funcOne;
  final Function funcTwo;
  final Function funcThree;
  final Function fucFour;
  final int index;

  const CustomBottomBar({
    Key? key,
    required this.size,
    required this.funcOne,
    required this.funcTwo,
    required this.funcThree,
    required this.fucFour,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: size.height * 0.085,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              color: AppColor.grey.withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: bottomBtn(
                textLabel: "Home",
                onTap: () {
                  funcOne();
                },
                index: index,
                lightIcon: AppImages.home,
                color: index == 0 ? AppColor.btnColor : AppColor.grey,
                textColor: index == 0 ? AppColor.btnColor : AppColor.grey,
              ),
            ),
            Expanded(
              child: bottomBtn(
                  textLabel: "My Ads",
                  onTap: () {
                    funcTwo();
                  },
                  index: index,
                  lightIcon: AppImages.myAds,
                  color: index == 1 ? AppColor.btnColor : AppColor.grey,
                  textColor: index == 1 ? AppColor.btnColor : AppColor.grey),
            ),
            Expanded(
              child: bottomBtn(
                textLabel: "Keywords",
                onTap: () {
                  funcThree();
                },
                index: index,
                lightIcon: AppImages.keywords,
                color: index == 2 ? AppColor.btnColor : AppColor.grey,
                textColor: index == 2 ? AppColor.btnColor : AppColor.grey,
              ),
            ),
            Expanded(
              child: bottomBtn(
                textLabel: "Billing",
                onTap: () {
                  fucFour();
                },
                index: index,
                lightIcon: AppImages.billing,
                color: index == 3 ? AppColor.btnColor : AppColor.grey,
                textColor: index == 3 ? AppColor.btnColor : AppColor.grey,
              ),
            ),
          ],
        ));
  }

  Widget bottomBtn({
    required Function onTap,
    required int index,
    required String lightIcon,
    required Color color,
    required Color textColor,
    required String textLabel,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onTap();
      },
      child: Container(
        // height: size.height * 0.1,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.014),
        child: Column(
          children: [
            Image.asset(
              lightIcon,
              fit: BoxFit.cover,
              height: size.height * 0.029,
              color: color,
            ),
            SizedBox(height: size.height * 0.009),
            Text(
              textLabel,
              style: TextStyle(
                letterSpacing: 0.34,
                fontSize: size.width * 0.033,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
