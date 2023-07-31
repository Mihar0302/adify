import 'package:adify/controller/global_controller.dart';
import 'package:flutter/material.dart';

import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:get/get.dart';

class CreateCampaignsScreen extends StatefulWidget {
  const CreateCampaignsScreen({super.key});

  @override
  State<CreateCampaignsScreen> createState() => _CreateCampaignsScreenState();
}

class _CreateCampaignsScreenState extends State<CreateCampaignsScreen> {
  final GlobalController globalController = Get.find();

  final List adsOptions = [
    'Impressions',
    'Clicks',
    'Conversions',
    'Conversions Value',
    'Cost',
    'CTR',
    'CPA',
    'ROAS',
  ];

  List selectedAdsOptionList = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFf9fafc),
      appBar: appBar(context, size),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.height * 0.025),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Metrics to display by platform',
                style: TextStyle(
                  letterSpacing: 0.34,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textBlackColor,
                  fontSize: size.width * 0.042,
                ),
              ),
              SizedBox(height: size.height * 0.013),
              Text(
                'Select the 4 metrics you\'d like to display in the campaign\'s view for each connected platform.',
                style: TextStyle(
                  letterSpacing: 0.34,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textGreyColor.withOpacity(0.8),
                  fontSize: size.width * 0.034,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              dropDownWidget(size),
              SizedBox(height: size.height * 0.002),
              Obx(
                () => globalController.showDropDown.isTrue
                    ? adsOptionList(size)
                    : const SizedBox.shrink(),
              ),
              SizedBox(height: size.height * 0.002),
            ],
          ),
        ),
      ),
    );
  }

  Widget adsOptionList(Size size) {
    return ListView.builder(
      itemCount: adsOptions.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          if (selectedAdsOptionList.contains(adsOptions[index])) {
            setState(() {
              selectedAdsOptionList.remove(adsOptions[index]);
            });
          } else {
            setState(() {
              selectedAdsOptionList.add(adsOptions[index]);
            });
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.height * 0.025),
          margin: EdgeInsets.only(bottom: size.height * 0.015),
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(6)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                adsOptions[index],
                style: TextStyle(
                  letterSpacing: 0.34,
                  fontWeight: FontWeight.w700,
                  color: selectedAdsOptionList.contains(adsOptions[index])
                      ? AppColor.btnColor
                      : AppColor.textBlackColor,
                  fontSize: size.width * 0.034,
                ),
              ),
              Icon(Icons.check,
                  color: selectedAdsOptionList.contains(adsOptions[index])
                      ? AppColor.green
                      : AppColor.white)
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDownWidget(Size size) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.025),
        child: GestureDetector(
          onTap: () => globalController.activeDropDownFun(),
          child: Row(children: [
            Image.asset("assets/images/drive.png",
                height: size.height * 0.04, width: size.width * 0.04),
            SizedBox(width: size.width * 0.02),
            Text(
              'Google Ads',
              style: TextStyle(
                letterSpacing: 0.34,
                fontWeight: FontWeight.w600,
                color: AppColor.textBlackColor,
                fontSize: size.width * 0.041,
              ),
            ),
            const Spacer(),
            Icon(
                globalController.showDropDown.isTrue
                    ? Icons.keyboard_arrow_down_outlined
                    : Icons.keyboard_arrow_up_outlined,
                color: globalController.showDropDown.isTrue
                    ? AppColor.btnColor
                    : AppColor.textGreyColor)
          ]),
        ),
      ),
    );
  }

  appBar(BuildContext context, Size size) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      backgroundColor: AppColor.white,
      automaticallyImplyLeading: false,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.04, right: size.width * 0.04),
          child: Image.asset(AppImages.arrowRight,
              height: size.height * 0.031, color: AppColor.btnColor),
        ),
      ),
      title: Text(
        'Campaigns',
        style: TextStyle(
          letterSpacing: 0.34,
          fontWeight: FontWeight.bold,
          color: AppColor.btnColor,
          fontSize: size.width * 0.042,
        ),
      ),
    );
  }
}
