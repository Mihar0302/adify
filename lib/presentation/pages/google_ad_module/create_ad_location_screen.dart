// ignore_for_file: unused_import

import 'package:adify/controller/add_keywords_controller.dart';
import 'package:adify/controller/global_controller.dart';
import 'package:adify/presentation/pages/google_ad_module/add_keyword_screen.dart';
import 'package:adify/presentation/pages/google_ad_module/widgets/next_buttoon_widget.dart';
import 'package:flutter/material.dart';
import 'package:adify/presentation/pages/google_ad_module/widgets/location_radius_widget.dart';
import 'package:adify/presentation/pages/google_ad_module/widgets/location_widget.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../helper/http_helper.dart';
import '../../../utils/route_string.dart';
import 'create_ad_bussiness_screen.dart';

class CreateAdLocationScreen extends StatefulWidget {
  final bool update;

  const CreateAdLocationScreen({
    super.key,
    required this.update,
  });

  @override
  State<CreateAdLocationScreen> createState() => _CreateAdLocationScreenState();
}

class _CreateAdLocationScreenState extends State<CreateAdLocationScreen> {
  int currentTab = 0;
  final GlobalController global = Get.find();
  final AddKeywordsController addKeywordsController = Get.find();
  final _formKey = GlobalKey<FormState>();

  // BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  // Set<Circle> circles = {};

  @override
  void initState() {
    debugPrint("====> uodate datac ===> ${widget.update}");
    super.initState();
    // addCustomIcon();
    // global.markers.add(Marker(
    //   markerId: MarkerId(global.showlocation.toString()),
    //   // draggable: true,
    //   position: global.showlocation,
    //   infoWindow: InfoWindow(
    //     title: global.placemarks.isNotEmpty
    //         ? global.placemarks[0].country
    //         : 'Country',
    //     snippet: global.placemarks.isNotEmpty
    //         ? global.placemarks[0].street
    //         : 'Street',
    //   ),
    //   icon: markerIcon,
    // ));
  }

  // void addCustomIcon() {
  //   BitmapDescriptor.fromAssetImage(
  //           const ImageConfiguration(), AppImages.marker)
  //       .then(
  //     (icon) {
  //       setState(() {
  //         markerIcon = icon;
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackColor,
      appBar: appBar(context, size),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.025),
        child: Obx(
          () => Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                headerWidget(size),
                SizedBox(height: size.height * 0.022),
                progressWidget(size),
                SizedBox(height: size.height * 0.04),
                Text(
                  textAlign: TextAlign.center,
                  "Choose the location where you want to advertise. Your ads will be shown in the selected region",
                  style: TextStyle(
                    fontSize: size.width * 0.038,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: global.locationTabIndex.value == 0
                      ? LocationWidget(
                          update: widget.update,
                          size: size,
                          locationCtrl: addKeywordsController.locationCtrl)
                      : RadiusWidget(size: size),
                ),
                widget.update
                    ? Center(
                        child: UpdateBtn(
                          size: size,
                          btnName: "Save & Update",
                          onClick: () {
                            addKeywordsController.Updatelocatioapicall(
                              campaignId:
                                  addKeywordsController.campaingId.value,
                              locationid: addKeywordsController.locationData,
                            );
                          },
                        ),
                      )
                    : Container(),
                SizedBox(height: size.height * 0.01),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.03),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Preview",
                        style: TextStyle(
                          color: AppColor.btnColor,
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.05),
                    Expanded(
                      child: NextButtonWidget(
                          title: 'Next',
                          globalController: global,
                          onClick: () {
                            if (_formKey.currentState!.validate()) {
                              addKeywordsController.location_ids.clear();
                              addKeywordsController.location_ids =
                                  addKeywordsController.locationData;
                              addKeywordsController.SuggestionsApiCall(
                                  businessCategory:
                                      addKeywordsController.categoryCtrl.text,
                                  businessName: addKeywordsController
                                      .businessNameCtrl.text);
                              Get.to(
                                () => AddKeyWordScreen(
                                  updates: widget.update,
                                ),
                              );
                            }
                          },
                          size: size),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tabBar(Size size) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
                2,
                (index) => GestureDetector(
                      onTap: () {
                        global.locationSelectTab(index);
                      },
                      child: Container(
                        width: size.width / 2.7,
                        height: size.height * 0.07,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: global.locationTabIndex.value == index
                              ? AppColor.btnColor
                              : AppColor.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Text(
                          ['Location', 'Radius'][index],
                          style: TextStyle(
                              letterSpacing: 0.34,
                              color: global.locationTabIndex.value == index
                                  ? AppColor.white
                                  : AppColor.textGreyColor,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }

  Widget progressWidget(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: size.height * 0.013,
          width: size.width / 4.8,
          decoration: BoxDecoration(
              color: AppColor.btnColor,
              borderRadius: BorderRadius.circular(50)),
        ),
        Container(
          height: size.height * 0.013,
          width: size.width / 4.8,
          decoration: BoxDecoration(
              color: AppColor.black, borderRadius: BorderRadius.circular(50)),
        ),
        Container(
          height: size.height * 0.013,
          width: size.width / 4.8,
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(50)),
        ),
        Container(
          height: size.height * 0.013,
          width: size.width / 4.8,
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(50)),
        )
      ],
    );
  }

  Widget headerWidget(Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Business",
          style: TextStyle(
            letterSpacing: 0.34,
            fontWeight: FontWeight.w600,
            fontSize: size.width * 0.036,
            color: AppColor.btnColor,
          ),
        ),
        SizedBox(width: size.width * 0.012),
        slashWidget(size),
        SizedBox(width: size.width * 0.009),
        Text(
          "Location",
          style: TextStyle(
            letterSpacing: 0.34,
            color: AppColor.black,
            fontSize: size.width * 0.036,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: size.width * 0.012),
        slashWidget(size),
        SizedBox(width: size.width * 0.009),
        Text(
          "Preview",
          style: TextStyle(
            letterSpacing: 0.34,
            color: AppColor.textGreyColor,
            fontSize: size.width * 0.036,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: size.width * 0.012),
        slashWidget(size),
        SizedBox(width: size.width * 0.009),
        Text(
          'Budget',
          style: TextStyle(
            letterSpacing: 0.34,
            color: AppColor.textGreyColor,
            fontSize: size.width * 0.036,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget slashWidget(Size size) {
    return Text(
      "/",
      style: TextStyle(
        letterSpacing: 0.34,
        color: AppColor.textGreyColor,
        fontSize: size.width * 0.036,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  AppBar appBar(BuildContext context, Size size) {
    return AppBar(
      centerTitle: true,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.04, right: size.width * 0.04),
          child: Image.asset(
            AppImages.arrowRight,
            height: size.height * 0.031,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImages.speaker,
            fit: BoxFit.contain,
            height: size.height * 0.035,
          ),
          Text(
            "ADIFY",
            style: TextStyle(
              letterSpacing: 0.34,
              color: AppColor.black,
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.05,
            ),
          ),
        ],
      ),
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: AppColor.white,
      actions: [
        Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.023,
              bottom: size.height * 0.023,
              left: size.width * 0.04,
              right: size.width * 0.04),
          child: InkWell(
            onTap: () {},
            child: Image.asset(AppImages.diamond, height: size.height * 0.028),
          ),
        ),
      ],
    );
  }
}
