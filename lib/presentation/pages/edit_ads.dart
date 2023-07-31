import 'package:adify/presentation/widgets/custom_appbar.dart';
import 'package:adify/presentation/widgets/custom_btn.dart';
import 'package:adify/presentation/widgets/custom_text_feild.dart';
import 'package:adify/utils/app_color.dart';
import 'package:adify/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditAdsScreen extends StatefulWidget {
  const EditAdsScreen({super.key});

  @override
  State<EditAdsScreen> createState() => _EditAdsScreenState();
}

class _EditAdsScreenState extends State<EditAdsScreen> {
  final TextEditingController urlController = TextEditingController();
  var displayUrlController =
      List.generate(3, (index) => TextEditingController());
  var headlinesController =
      List.generate(4, (index) => TextEditingController(text: '1'));
  var descriptionController =
      List.generate(2, (index) => TextEditingController(text: '1'));
  var headingLength = List.generate(4, (index) => '0');

  @override
  void initState() {
    urlController.text = "www.adify.tech";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.scaffoldBackColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBarWidget(size, context),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04, vertical: size.height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  finalUrlField(size),
                  SizedBox(height: size.height * 0.048),
                  fieldLable(size, 'Display URL'),
                  displayUrlField(size),
                  SizedBox(height: size.height * 0.048),
                  fieldLable(size, 'Headlines'),
                  headLinesList(size),
                  addHeadlines(size),
                  SizedBox(height: size.height * 0.048),
                  fieldLable(size, 'Description'),
                  descriptionList(size),
                  descriptionLable(size),
                  SizedBox(height: size.height * 0.05),
                  cancelButton(context, size),
                  CustomBtn(
                      size: size,
                      iconShow: false,
                      btnName: "Update",
                      onClick: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cancelButton(BuildContext context, Size size) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(
          'Cancel',
          style: TextStyle(
            letterSpacing: 0.34,
            fontWeight: FontWeight.w500,
            color: AppColor.textGreyColor,
            fontSize: size.height * 0.024,
          ),
        ),
      ),
    );
  }

  Widget descriptionLable(Size size) {
    return Row(
      children: [
        const Icon(
          Icons.add,
          color: Color(0xff4285F4),
        ),
        SizedBox(width: size.width * 0.03),
        Text(
          'Add Description',
          style: TextStyle(
            letterSpacing: 0.34,
            fontWeight: FontWeight.w500,
            color: const Color(0xff4285F4),
            fontSize: size.height * 0.022,
          ),
        ),
      ],
    );
  }

  Widget descriptionList(Size size) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: size.height * 0.02),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextFild2(
                    size: size,
                    hint: '',
                    textStyle: TextStyle(
                      letterSpacing: 0.34,
                      fontSize: size.height * 0.024,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff4285F4),
                    ),
                    controller: descriptionController[index],
                    inputFormatter: [
                      LengthLimitingTextInputFormatter(30),
                    ],
                    prefix: descriptionController[index].text.isNotEmpty
                        ? const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Align(
                              widthFactor: 0.6,
                              heightFactor: 1.0,
                              // alignment: Alignment.bottomCenter,
                              child: ImageIcon(
                                AssetImage(AppImages.pin),
                                color: Color(0xff4285F4),
                                size: 30,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                InkWell(
                    onTap: () {
                      setState(() {
                        descriptionController[index].clear();
                      });
                    },
                    child: Icon(
                      Icons.close,
                      color: AppColor.textGreyColor,
                    ))
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: size.width * 0.09),
                child: Text(
                  '(${descriptionController[index].text.length}/30)',
                  style: TextStyle(
                    letterSpacing: 0.34,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textGreyColor,
                    fontSize: size.height * 0.018,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget addHeadlines(Size size) {
    return Row(
      children: [
        const Icon(
          Icons.add,
          color: Color(0xff4285F4),
        ),
        SizedBox(width: size.width * 0.03),
        Text(
          'Add Headlines',
          style: TextStyle(
            letterSpacing: 0.34,
            fontWeight: FontWeight.w500,
            color: const Color(0xff4285F4),
            fontSize: size.height * 0.022,
          ),
        ),
      ],
    );
  }

  Widget headLinesList(Size size) {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: size.height * 0.02),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextFild2(
                    size: size,
                    hint: '',
                    textStyle: TextStyle(
                      letterSpacing: 0.34,
                      fontSize: size.height * 0.024,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff4285F4),
                    ),
                    controller: headlinesController[index],
                    inputFormatter: [
                      LengthLimitingTextInputFormatter(30),
                    ],
                    prefix: headlinesController[index].text.isNotEmpty
                        ? const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Align(
                              widthFactor: 0.6,
                              heightFactor: 1.0,
                              // alignment: Alignment.bottomCenter,
                              child: ImageIcon(
                                AssetImage(AppImages.pin),
                                color: Color(0xff4285F4),
                                size: 30,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                InkWell(
                    onTap: () {
                      setState(() {
                        headlinesController[index].clear();
                      });
                    },
                    child: Icon(
                      Icons.close,
                      color: AppColor.textGreyColor,
                    ))
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: size.width * 0.09),
                child: Text(
                  '(${headlinesController[index].text.length}/30)',
                  style: TextStyle(
                    letterSpacing: 0.34,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textGreyColor,
                    fontSize: size.height * 0.018,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget fieldLable(Size size, String lable) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: size.height * 0.012, left: size.width * 0.01),
      child: Text(
        lable,
        style: TextStyle(
          letterSpacing: 0.34,
          fontWeight: FontWeight.w500,
          color: AppColor.textGreyColor,
          fontSize: size.height * 0.019,
        ),
      ),
    );
  }

  Widget displayUrlField(Size size) {
    return Row(
        children: List.generate(
      3,
      (index) => Expanded(
        child: CustomTextFild2(
          size: size,
          hint: '',
          margin: false,
          textStyle: TextStyle(
            letterSpacing: 0.34,
            fontSize: size.height * 0.020,
            fontWeight: FontWeight.w600,
            color: AppColor.textBlackColor,
          ),
          controller: displayUrlController[index],
        ),
      ),
    )

        //  [
        //   Expanded(
        //     child: CustomTextFild2(
        //       size: size,
        //       hint: '',
        //       margin: false,
        //       controller: displayUrlController,
        //     ),
        //   ),
        //   Expanded(
        //     child: CustomTextFild2(
        //       size: size,
        //       hint: '',
        //       margin: false,
        //       controller: displayUrlController,
        //     ),
        //   ),
        //   Expanded(
        //     child: CustomTextFild2(
        //       size: size,
        //       hint: '',
        //       margin: false,
        //       controller: displayUrlController,
        //     ),
        //   ),
        // ],
        );
  }

  Widget finalUrlField(Size size) {
    return CustomTextFild(
      label: "Final URL",
      margin: false,
      size: size,
      hint: "",
      controller: urlController,
    );
  }

  Widget appBarWidget(Size size, BuildContext context) {
    return CustomAppbar(
      size: size,
      onClick: () {
        Navigator.pop(context);
      },
      campaing: true,
      mainLabel: "EDIT ADS",
      widgetShow: true,
      widget: InkWell(
        onTap: () {},
        child: Image.asset(AppImages.setting, height: size.height * 0.028),
      ),
    );
  }
}
