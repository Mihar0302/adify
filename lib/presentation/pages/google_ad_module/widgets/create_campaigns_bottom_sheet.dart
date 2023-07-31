// ignore_for_file: unused_import

import 'package:adify/presentation/pages/google_ad_module/create_ad_bussiness_screen.dart';
import 'package:flutter/material.dart';

import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:adify/utils/route_string.dart';

import '../../../../controller/global_controller.dart';
import 'next_buttoon_widget.dart';
import 'package:get/get.dart';

class CreateNewCampaignsWidget extends StatelessWidget {
  final Size size;

  CreateNewCampaignsWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final List selectPlatForm = [];

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.find();

    return StatefulBuilder(builder: (context, setState) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              bottomSheetHeader(context),
              SizedBox(height: size.height * 0.035),
              platFormList1(setState),
              SizedBox(height: size.height * 0.031),
              platFormList2(setState),
              SizedBox(height: size.height * 0.033),
              NextButtonWidget(
                size: size,
                globalController: globalController,
                title: 'Next',
                onClick: () {
                  if (selectPlatForm.isNotEmpty) {
                    Get.to(() =>
                    const CreateAdBusinessScreen(
                        campaingId: '', update: false));
                    // Navigator.pushNamed(
                    //     context, RouteString.CREATE_AD_BUSINESS);
                  }
                },
              )
            ],
          ),
        ),
      );
    });
  }

  Widget platFormList2(setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        ['Twitter', 'Linkedin', 'Tiktok'].length,
            (index) =>
            GestureDetector(
              onTap: () {
                if (selectPlatForm
                    .contains(['Twitter', 'Linkedin', 'Tiktok'][index])) {
                  setState(() {
                    selectPlatForm.remove(
                        ['Twitter', 'Linkedin', 'Tiktok'][index]);
                  });
                } else {
                  setState(() {
                    selectPlatForm.add(['4', '5', '6'][index]);
                  });
                }
              },
              child: Container(
                height: size.height / 10,
                width: size.width / 5,
                padding: EdgeInsets.all(size.height * 0.03),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.white,
                    border: Border.all(
                        color: selectPlatForm.contains(['', '', ''][index])
                            ? const Color(0xff4285F4)
                            : Colors.transparent,
                        width: 1.5)),
                child: ImageIcon(
                  AssetImage(
                    [
                      AppImages.twitter,
                      AppImages.linkedin,
                      AppImages.tiktok
                    ][index],
                  ),
                  color: selectPlatForm.contains(['', '', ''][index])
                      ? const Color(0xff4285F4)
                      : Colors.black,
                  // size: size.height * 0.05,
                ),
              ),
            ),
      ),
    );
  }

  Widget platFormList1(setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        ['Google', 'Facebook', 'Windows'].length,
            (index) =>
            GestureDetector(
              onTap: () {
                if (selectPlatForm.contains(['Google', '2', '3'][index])) {
                  setState(() {
                    selectPlatForm.remove(['Google', '2', '3'][index]);
                  });
                } else {
                  setState(() {
                    selectPlatForm.add(['Google', '2', '3'][index]);
                  });
                }
              },
              child: Container(
                height: size.height / 10,
                width: size.width / 5,
                padding: EdgeInsets.all(size.height * 0.03),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.white,
                    border: Border.all(
                        color: selectPlatForm
                            .contains(['Google', 'Facebook', 'Windows'][index])
                            ? const Color(0xff4285F4)
                            : Colors.transparent,
                        width: 1.5)),
                child: Image.asset(
                  [
                    AppImages.google2,
                    AppImages.facebook,
                    AppImages.windows
                  ][index],
                ),
                // color: selectPlatForm
                //         .contains(['Google', 'Facebook', 'Windows'][index])
                //     ? const Color(0xff4285F4)
                //     : Colors.black,
                // size: size.height * 0.05,
              ),
            ),
      ),
    );
  }

  Widget bottomSheetHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Create new Campaigns".toUpperCase(),
          style: TextStyle(
            letterSpacing: 0.34,
            fontSize: size.width * 0.045,
            color: AppColor.textBlackColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            AppImages.close,
            height: size.height * 0.06,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
