import 'package:adify/presentation/widgets/custom_report_container.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:flutter/material.dart';

class SearchTermWidget extends StatelessWidget {
  final Size size;

  const SearchTermWidget({super.key, required this.size});

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
                nextShow: true,
                size: size,
                firstText: "23",
                secondText: "23",
                threeText: "23",
                fourText: "23",
                widget: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Google Ads",
                          style: TextStyle(
                            letterSpacing: 0.34,
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.038,
                          ),
                        ),
                        SizedBox(width: size.width * 0.04),
                        Image.asset(
                          AppImages.dott,
                          height: size.height * 0.008,
                          color: AppColor.grey.withOpacity(0.5),
                        ),
                        SizedBox(width: size.width * 0.01),
                        Text(
                          "Search",
                          style: TextStyle(
                              letterSpacing: 0.34,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grey,
                              fontSize: size.width * 0.033),
                        ),
                        SizedBox(width: size.width * 0.03),
                      ],
                    ),
                    SizedBox(height: size.height * 0.006),
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
