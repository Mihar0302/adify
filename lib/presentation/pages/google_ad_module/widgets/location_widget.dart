import 'package:adify/controller/add_keywords_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adify/controller/global_controller.dart';
import 'package:adify/presentation/pages/google_ad_module/widgets/custom_text_btn.dart';
import 'package:adify/presentation/widgets/custom_text_feild.dart';
import 'package:adify/utils/app_color.dart';

class LocationWidget extends StatefulWidget {
  final bool update;
  final TextEditingController locationCtrl;

  const LocationWidget({
    super.key,
    required this.size,
    required this.locationCtrl,
    required this.update,
  });

  final Size size;

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  final GlobalController global = Get.find();
  AddKeywordsController keywordsController = Get.find();

  final premiumList = [
    'Langauge',
    'Start and End date',
    'Ad shedule',
    'Ad rotation ',
  ];

  RxString geoTargetConstant = "".obs;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          // googleMapView(),
          SizedBox(height: widget.size.height * 0.035),
          locationField(),
          SizedBox(height: widget.size.height * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.size.width * 0.06),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Location",
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: size.width * 0.042,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: size.width * 0.07),
                Expanded(
                  child: Text(
                    "Reach",
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: size.width * 0.042,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: keywordsController.locationData.length,
              itemBuilder: (context, int i) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: 30,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          keywordsController.locationData[i]["location"],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          keywordsController.locationData.removeAt(i);
                          setState(() {});
                        },
                        child: Icon(
                          Icons.close,
                          size: size.width * 0.04,
                        ),
                      ),
                    ],
                  ),
                );
              }),
          SizedBox(height: widget.size.height * 0.02),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: keywordsController.locationSugeetion.length,
              itemBuilder: (context, int i) {
                return InkWell(
                  onTap: () {
                    String datalocation = keywordsController
                        .locationSugeetion[i]["geo_target_constant"];
                    var sumdata = datalocation.split("/");
                    geoTargetConstant.value = sumdata.last;
                    keywordsController.locationCtrl.text =
                        keywordsController.locationSugeetion[i]["location"];
                    Map data = {
                      "location": keywordsController.locationSugeetion[i]
                          ["location"],
                      "geoTargetConstant": geoTargetConstant.value
                    };
                    keywordsController.locationData.add(data);
                    debugPrint(
                        "==> ${keywordsController.locationSugeetion[i]["geo_target_constant"]}");
                    debugPrint(
                        "===>locationSugeetion ==========>  ${geoTargetConstant.value}");
                    keywordsController.locationSugeetion.removeAt(i);
                    setState(() {});
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    height: 30,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            keywordsController.locationSugeetion[i]["location"],
                          ),
                        ),
                        Expanded(child: Container()),
                        Expanded(
                          child: Text(
                              "${keywordsController.locationSugeetion[i]["reach"]}"),
                        ),
                        Expanded(child: Container()),
                        Expanded(
                          child: Text(
                            "Select",
                            style: TextStyle(
                              color: AppColor.btnColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          SizedBox(height: widget.size.height * 0.3),
          // premiumOptions(),
        ],
      ),
    );
  }

  Widget premiumOptions() {
    return Column(
      children: List.generate(
        premiumList.length,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: widget.size.height * 0.03),
          child: CustomTextButton(
            size: widget.size,
            text: premiumList[index],
            onTap: () {},
          ),
        ),
      ),
    );
  }

  TableRow rowSpacer() => TableRow(children: [
        SizedBox(height: widget.size.height * 0.02),
        SizedBox(height: widget.size.height * 0.02),
        SizedBox(height: widget.size.height * 0.02)
      ]);

  TableRow tableHeading() {
    return TableRow(children: [
      Text(
        'Area',
        style: TextStyle(
            letterSpacing: 0.34,
            color: AppColor.textGreyColor,
            fontSize: widget.size.width * 0.03,
            fontWeight: FontWeight.w500),
      ),
      Text(
        'Reach',
        style: TextStyle(
            letterSpacing: 0.34,
            color: AppColor.textGreyColor,
            fontSize: widget.size.width * 0.03,
            fontWeight: FontWeight.w500),
      ),
      const Text('')
    ]);
  }

  // Widget googleMapView() {
  //   return Container(
  //     height: widget.size.height / 3,
  //     decoration: BoxDecoration(
  //       color: AppColor.white.withOpacity(0.5),
  //       borderRadius: const BorderRadius.all(Radius.circular(8)),
  //     ),
  //     child: GoogleMap(
  //       zoomGesturesEnabled: true,
  //       initialCameraPosition: CameraPosition(
  //           target: global.showlocation, zoom: 11.0, tilt: 0, bearing: 0),
  //       myLocationEnabled: true,
  //       mapType: MapType.normal,
  //       myLocationButtonEnabled: false,
  //       zoomControlsEnabled: false,
  //       markers: global.markers,
  //       onMapCreated: (GoogleMapController mapcontroller) {
  //         if (!controller.isCompleted) {
  //           setState(() {
  //             controller.complete(mapcontroller);
  //           });
  //         }
  //       },
  //     ),
  //   );
  // }

  Widget locationField() {
    return CustomTextFild(
        onChanged: (val) {
          keywordsController.locationSuggetion();
        },
        label: "Enter location",
        margin: false,
        size: widget.size,
        hint: "Enter location",
        validator: (value) {
          if (keywordsController.locationCtrl.text.isEmpty) {
            return "Please Enter Location";
          } else {
            return null;
          }
        },
        controller: keywordsController.locationCtrl);
  }
}

class LocationAndReach {
  final String location;
  final String geoTargetConstant;

  LocationAndReach({
    required this.location,
    required this.geoTargetConstant,
  });
}
