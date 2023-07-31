import 'package:adify/presentation/widgets/custom_report_container.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:flutter/material.dart';

class PausedWidget extends StatelessWidget {
  final Size size;

  const PausedWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, int i) {
              return CustomReportContainer(
                size: size,
                firstText: "23",
                secondText: "23",
                threeText: "23",
                fourText: "23",
                widget: Row(
                  children: [
                    Text(
                      "Google Ads",
                      style: TextStyle(
                        letterSpacing: 0.34,
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * 0.038,
                      ),
                    ),
                    Expanded(child: Container()),
                    Image.asset(
                      AppImages.dott,
                      height: size.height * 0.008,
                      color: AppColor.grey.withOpacity(0.5),
                    ),
                    SizedBox(width: size.width * 0.02),
                    Text(
                      "Search",
                      style: TextStyle(
                        letterSpacing: 0.34,
                        fontWeight: FontWeight.w400,
                        color: AppColor.grey,
                        fontSize: size.width * 0.033,
                      ),
                    ),
                    SizedBox(width: size.width * 0.03),
                    Image.asset(
                      AppImages.dott,
                      height: size.height * 0.008,
                      color: AppColor.grey.withOpacity(0.5),
                    ),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      "\$${5}",
                      style: TextStyle(
                        letterSpacing: 0.34,
                        fontWeight: FontWeight.w400,
                        color: AppColor.grey,
                        fontSize: size.width * 0.033,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.0027,
                        horizontal: size.width * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.ambr.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "ACTIVE",
                            style: TextStyle(
                              letterSpacing: 0.34,
                              color: AppColor.ambr,
                              fontSize: size.width * 0.033,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: size.width * 0.001),
                          Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: AppColor.ambr,
                            size: size.height * 0.025,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                onClick: () {},
              );
            },
          )
        ],
      ),
    );
  }
}
