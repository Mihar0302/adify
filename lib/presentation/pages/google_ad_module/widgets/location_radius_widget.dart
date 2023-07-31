import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adify/controller/global_controller.dart';
import 'package:adify/presentation/widgets/custom_slider_shape.dart';
import 'package:adify/presentation/widgets/custom_text_feild.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/route_string.dart';

import 'next_buttoon_widget.dart';

class RadiusWidget extends StatefulWidget {
  const RadiusWidget({super.key, required this.size});

  final Size size;

  @override
  State<RadiusWidget> createState() => _RadiusWidgetState();
}

class _RadiusWidgetState extends State<RadiusWidget> {
  final TextEditingController addressCtrl = TextEditingController();
  // final Completer<GoogleMapController> controller = Completer();
  final GlobalController globalController = Get.find();

  final GlobalController global = Get.find();
  final int radius = 25;
  final int minVal = 0;
  final int maxVal = 50;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: widget.size.height * 0.035),
          addressField(),
          SizedBox(height: widget.size.height * 0.035),
          selectAreaRadius(radius, maxVal, minVal),
          SizedBox(height: widget.size.height * 0.09),
          NextButtonWidget(
              title: 'Preview your ad',
              globalController: globalController,
              onClick: () {
                Navigator.pushNamed(context, RouteString.ADD_KEYWORD);
              },
              size: widget.size)
        ],
      ),
    );
  }

  Widget selectAreaRadius(int radius, int maxVal, int minVal) {
    return Container(
      width: widget.size.width,
      padding: EdgeInsets.symmetric(
        vertical: widget.size.height * 0.025,
        horizontal: widget.size.width * 0.035,
      ),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Select your radius',
            style: TextStyle(
              letterSpacing: 0.34,
              fontSize: widget.size.height * 0.02,
              fontWeight: FontWeight.w600,
              color: AppColor.textGreyColor.withOpacity(0.8),
            ),
          ),
          SizedBox(height: widget.size.height * 0.01),
          StatefulBuilder(builder: (context, setState) {
            return SliderTheme(
              data: SliderThemeData(
                  overlayShape: SliderComponentShape.noOverlay,
                  activeTrackColor: AppColor.btnColor,
                  inactiveTrackColor: AppColor.white,
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: widget.size.height * 0.013,
                    pressedElevation: 0.0,
                  ),
                  trackShape: SliderCustomTrackShape()),
              child: Slider(
                value: radius.toDouble(),
                max: maxVal.toDouble(),
                min: minVal.toDouble(),
                label: '${radius.round()}',
                onChanged: (value) {
                  setState(() {
                    radius = value.toInt();
                  });
                },
              ),
            );
          }),
          SizedBox(height: widget.size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${minVal.toString()}km',
                style: TextStyle(
                  letterSpacing: 0.34,
                  fontSize: widget.size.height * 0.02,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textGreyColor.withOpacity(0.8),
                ),
              ),
              Text(
                '${maxVal.toString()}km',
                style: TextStyle(
                  letterSpacing: 0.34,
                  fontSize: widget.size.height * 0.02,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textGreyColor.withOpacity(0.8),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget addressField() {
    return CustomTextFild(
        label: "",
        margin: false,
        size: widget.size,
        hint: "Enter your address",
        controller: addressCtrl);
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
  //           target: global.showlocation, zoom: 19.0, tilt: 0, bearing: 0),
  //       myLocationEnabled: true,
  //       mapType: MapType.normal,
  //       myLocationButtonEnabled: false,
  //       zoomControlsEnabled: false,
  //       markers: global.markers,
  //       onMapCreated: (GoogleMapController mapcontroller) {
  //         if (!controller.isCompleted) {
  //           setState(
  //             () {
  //               controller.complete(mapcontroller);
  //             },
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }
}
