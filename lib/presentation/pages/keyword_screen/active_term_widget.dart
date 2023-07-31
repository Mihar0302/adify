import 'package:adify/presentation/widgets/custom_report_container.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:flutter/material.dart';

class ActiveTermWidget extends StatelessWidget {
  final Size size;

  const ActiveTermWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
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
                              SizedBox(width: size.width * 0.001),
                              Icon(Icons.keyboard_arrow_right_outlined, color: AppColor.green, size: size.height * 0.025),
                            ],
                          ),
                        )
                      ],
                    ),
                    onClick: () {
                      showAlertDialog(context);
                    },
                  );
                },
              )
            ],
          ),
        ),
        FractionalTranslation(
          translation: Offset(size.width * 0.0165, size.height * 0.01),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  ),
                  isScrollControlled: true,
                  backgroundColor: AppColor.secondaryColor,
                  context: context,
                  builder: (BuildContext context) {
                    return Container();
                    // return AddKeywordBottomSheet(size: size);
                  });
            },
            child: CircleAvatar(
              backgroundColor: AppColor.btnColor,
              radius: size.height * 0.037,
              child: Icon(
                Icons.add,
                color: AppColor.white,
                size: size.height * 0.035,
              ),
            ),
          ),
        )
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    Widget cancelButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.white,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
      ),
      child: Text(
        "Cancel",
        style: TextStyle(
          color: AppColor.textGreyColor,
          fontWeight: FontWeight.w500,
          fontSize: size.width * 0.035,
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.white,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
      ),
      child: Text(
        "Continue",
        style: TextStyle(
          // color: AppColor.btnColor,
          color: const Color(0xFFF14336),
          fontWeight: FontWeight.w500,
          fontSize: size.width * 0.035,
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(
        'PAUSE AD',
        style: TextStyle(
          letterSpacing: 0.34,
          fontWeight: FontWeight.bold,
          color: AppColor.textBlackColor,
          fontSize: size.width * 0.045,
        ),
      ),
      content: Text(
        "Are you sure ?",
        style: TextStyle(
          letterSpacing: 0.34,
          color: AppColor.textGreyColor,
          fontWeight: FontWeight.w500,
          fontSize: size.width * 0.037,
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
