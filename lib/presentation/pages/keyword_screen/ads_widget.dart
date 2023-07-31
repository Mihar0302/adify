import 'package:adify/presentation/widgets/custom_report_container.dart';
import 'package:adify/utils/app_color.dart';
import 'package:flutter/material.dart';

class AdsWidget extends StatelessWidget {
  final Size size;

  const AdsWidget({super.key, required this.size});

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.5,
                              child: Text(
                                "Ea deserunt ad culpa magna ut tempor ullamco.",
                                style: TextStyle(
                                  letterSpacing: 0.34,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * 0.035,
                                  color: AppColor.btnColor,
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            SizedBox(
                              width: size.width * 0.6,
                              child: Text(
                                "Ea deserunt ad culpa magna ut tempor ullamco.",
                                style: TextStyle(
                                  letterSpacing: 0.34,
                                  fontWeight: FontWeight.w400,
                                  fontSize: size.width * 0.033,
                                  color: AppColor.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.0027,
                            horizontal: size.width * 0.02,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.green.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "ACTIVE",
                                style: TextStyle(
                                  letterSpacing: 0.34,
                                  color: AppColor.green,
                                  fontSize: size.width * 0.033,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: size.height * 0.015),
                    Container(
                      height: size.height * 0.0009,
                      width: size.width,
                      color: AppColor.grey,
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
