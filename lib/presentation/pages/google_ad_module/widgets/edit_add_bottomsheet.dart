// ignore_for_file: must_be_immutable

import 'package:adify/controller/add_keywords_controller.dart';
import 'package:flutter/material.dart';

import 'package:adify/presentation/widgets/custom_btn.dart';
// ignore: unused_import
import 'package:adify/presentation/widgets/custom_text_feild.dart';
import 'package:adify/utils/app_image.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../models/suggestmodal.dart';
import '../../../widgets/custom_error_textfiled.dart';

class EditAdsWidget extends StatefulWidget {
  final Size size;
  List<Headlinemodel> head;
  Function onclik;
  TextEditingController heading1Ctrl;
  TextEditingController heading2Ctrl;
  TextEditingController heading3Ctrl;
  TextEditingController description1Ctrl;
  TextEditingController description2Ctrl;
  List<Descriptionmodel> des;

  EditAdsWidget({
    Key? key,
    required this.size,
    required this.onclik,
    required this.description2Ctrl,
    required this.description1Ctrl,
    required this.heading1Ctrl,
    required this.heading2Ctrl,
    required this.heading3Ctrl,
    required this.des,
    required this.head,
  }) : super(key: key);

  @override
  State<EditAdsWidget> createState() => _EditAdsWidgetState();
}

class _EditAdsWidgetState extends State<EditAdsWidget> {
  final AddKeywordsController addKeywordsController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  RxString popUpValue = "any".obs;
  RxBool validateHeading1 = false.obs;
  RxBool validateHeading2 = false.obs;
  RxBool validateHeading3 = false.obs;
  RxBool validateDes1 = false.obs;
  RxBool validateDes2 = false.obs;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
          height: widget.size.height / 1.2,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: widget.size.width * 0.07,
                  right: widget.size.width * 0.07,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: widget.size.height * 0.04),
                  Row(
                    children: [
                      editAdLable(),
                      Expanded(child: Container()),
                      closeBtn(context),
                    ],
                  ),
                  SizedBox(height: widget.size.height * 0.03),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: firstHeadingField()),
                    ],
                  ),
                  SizedBox(height: widget.size.height * 0.03),
                  secondHeadinhField(),
                  SizedBox(height: widget.size.height * 0.03),
                  thirdHeadingField(),
                  SizedBox(height: widget.size.height * 0.03),
                  descriptionField(),
                  SizedBox(height: widget.size.height * 0.03),
                  secondDescriptionField(widget.size),
                  SizedBox(height: widget.size.height * 0.04),
                  updateBtn(),
                  SizedBox(height: widget.size.height * 0.02),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget updateBtn() {
    return CustomBtn(
      size: widget.size,
      iconShow: false,
      margin: false,
      onClick: widget.onclik,
      btnName: 'Update',
    );
  }

  Widget secondDescriptionField(Size size) {
    return Obx(
      () => CustomTextFieldWithError(
        max: 6,
        margin: false,
        numberKeyboard: false,
        hint: "",
        controller: widget.description2Ctrl,
        whit: true,
        onChange: () {
          if (widget.description2Ctrl.text.length > 90) {
            validateDes2.value = true;
          } else {
            validateDes2.value = false;
          }
        },
        size: size,
        error: validateDes2.value ? "Please don't Enter 90+ character" : "",
        label: 'Description 2',
      ),
    );
    // return CustomTextFild(
    //   size: widget.size,
    //   hint: '',
    //   controller: widget.description2Ctrl,
    //   label: 'Description 2',
    //   maxLines: 6,
    // );
  }

  Widget descriptionField() {
    return Obx(
      () => CustomTextFieldWithError(
        max: 6,
        margin: false,
        numberKeyboard: false,
        hint: "",
        controller: widget.description1Ctrl,
        whit: true,
        onChange: () {
          if (widget.description1Ctrl.text.length > 30) {
            validateDes1.value = true;
          } else {
            validateDes1.value = false;
          }
        },
        size: widget.size,
        error: validateDes1.value ? "Please don't Enter 90+ character" : "",
        label: 'Description 1',
      ),
    );
  }

  Widget thirdHeadingField() {
    return Obx(
      () => CustomTextFieldWithError(
        max: 1,
        margin: false,
        numberKeyboard: false,
        hint: "",
        controller: widget.heading3Ctrl,
        whit: true,
        onChange: () {
          if (widget.heading3Ctrl.text.length > 30) {
            validateHeading3.value = true;
          } else {
            validateHeading3.value = false;
          }
        },
        size: widget.size,
        error: validateHeading3.value ? "Please don't Enter 30+ character" : "",
        label: 'Heading 3',
      ),
    );
  }

  Widget secondHeadinhField() {
    return Obx(
      () => CustomTextFieldWithError(
        max: 1,
        margin: false,
        numberKeyboard: false,
        hint: "",
        controller: widget.heading2Ctrl,
        whit: true,
        onChange: () {
          if (widget.heading2Ctrl.text.length > 30) {
            validateHeading2.value = true;
          } else {
            validateHeading2.value = false;
          }
        },
        size: widget.size,
        error: validateHeading2.value ? "Please don't Enter 30+ character" : "",
        label: 'Heading 2',
      ),
    );
  }

  Widget firstHeadingField() {
    return Obx(
      () => CustomTextFieldWithError(
        max: 1,
        margin: false,
        numberKeyboard: false,
        hint: "",
        controller: widget.heading1Ctrl,
        whit: true,
        onChange: () {
          if (widget.heading1Ctrl.text.length > 30) {
            validateHeading1.value = true;
          } else {
            validateHeading1.value = false;
          }
        },
        size: widget.size,
        error: validateHeading1.value ? "Please don't Enter 30+ character" : "",
        label: 'Heading 1',
      ),
    );

  }

  Widget editAdLable() {
    return Text(
      "EDIT AD",
      style: TextStyle(
        letterSpacing: 0.34,
        fontSize: widget.size.width * 0.045,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget closeBtn(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(
        AppImages.close,
        height: widget.size.height * 0.043,
        fit: BoxFit.contain,
      ),
    );
  }
}

List a = [
  {
    "description": [
      "Wide range of trendy T-shirts for men, women & kids. Free shipping on orders above Rs 999",
      "Get stylish and comfortable T-shirts from Ajio. Free Shipping on orders above Rs 999"
    ],
    "headlines": [
      "Ajio T-Shirt - The perfect fit",
      "Free Shipping on Orders 50+",
      "Order Today and get 10% off"
    ]
  },
  {
    "description": [
      "Find the perfect tee for you from our collection of 100% Cotton shirts. Shop Today!",
      "A Tee For Every Mood. Graphic Tees, Striped Shirts & More Types Of Teensy Tees"
    ],
    "headlines": [
      "Ajio T-Shirt - 100% Cotton",
      "T-Shirts starting at Rs. 399",
      "Free Shipping on all Orders"
    ]
  },
  {
    "description": [
      "Get stylish with our latest collection of fashionable shirts from Ajio T-Shirt",
      "With Ajio T-Shirt, you'll always find the perfect shirt for any occasion."
    ],
    "headlines": [
      "Ajio T-Shirt - buy now!",
      "100s of Styles Available",
      "Order Your Custom T-Shirt"
    ]
  }
];

List b = [
  {
    "description": [
      {
        "text":
            "Wide range of trendy T-shirts for men, women & kids. Free shipping on orders above Rs 999",
        "position": "1"
      },
      {
        "text":
            "Get stylish and comfortable T-shirts from Ajio. Free Shipping on orders above Rs 999",
        "position": "1"
      }
    ],
    "headlines": [
      {"text": "Ajio T-Shirt - The perfect fit", "position": "1"},
      {"text": "Free Shipping on Orders 50+", "position": "1"},
      {"text": "Order Today and get 10% off", "position": "1"},
    ]
  },
  {
    "description": [
      {
        "text":
            "Get stylish with our latest collection of fashionable shirts from Ajio T-Shirt",
        "position": "1"
      },
      {
        "text":
            "With Ajio T-Shirt, you'll always find the perfect shirt for any occasion.",
        "position": "1"
      }
    ],
    "headlines": [
      {"text": "Ajio T-Shirt - The perfect fit", "position": "1"},
      {"text": "Free Shipping on Orders 50+", "position": "1"},
      {"text": "Order Today and get 10% off", "position": "1"},
    ]
  },
];
