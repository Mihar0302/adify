import 'package:adify/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWithError extends StatelessWidget {
  final Size size;
  final String hint;
  final bool whit;
  final bool cngsize;
  final bool margin;
  final int max;
  final bool obsertext;
  final TextEditingController controller;
  final Function? onChange;
  final Widget? button;
  final bool numberKeyboard;
  final List<TextInputFormatter>? inputFormatter;
  final String error;
  final String label;

  const CustomTextFieldWithError({
    Key? key,
    required this.size,
    required this.hint,
    required this.controller,
    this.whit = false,
    this.cngsize = false,
    this.margin = false,
    this.onChange,
    this.max = 1,
    this.obsertext = false,
    this.button,
    this.numberKeyboard = false,
    this.inputFormatter,
    required this.error,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: margin ? size.width * 0.06 : size.width * 0.01,
              bottom: size.height * 0.012),
          child: Text(
            label,
            style: TextStyle(
              letterSpacing: 0.34,
              fontWeight: FontWeight.w500,
              color: AppColor.textGreyColor,
              fontSize: size.height * 0.019,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: margin
              ? EdgeInsets.symmetric(horizontal: size.width * 0.07)
              : EdgeInsets.symmetric(horizontal: size.width * 0.01),
          padding: max != 1
              ? EdgeInsets.symmetric(
                  vertical: size.height * 0.01, horizontal: size.width * 0.03)
              : EdgeInsets.symmetric(
                  vertical: size.height * 0.0, horizontal: size.width * 0.03),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 1,
                color: Colors.grey.withOpacity(0.3),
              ),
            ],
            color: whit ? AppColor.white : const Color(0xFF1F222B),
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(
            //     color: whit ? AppColor.primaryColor : Colors.white12, width: 2),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  enableSuggestions: true,
                  cursorColor: AppColor.primaryColor,
                  autofocus: false,
                  autocorrect: true,
                  autofillHints: const [AutofillHints.countryCode],
                  keyboardType: numberKeyboard
                      ? TextInputType.number
                      : TextInputType.emailAddress,
                  inputFormatters: inputFormatter,
                  obscureText: obsertext,
                  maxLines: max,
                  textAlign: cngsize ? TextAlign.center : TextAlign.start,
                  controller: controller,
                  style: TextStyle(
                    fontSize: size.width * 0.042,
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (String value) {
                    if (onChange != null) {
                      onChange!();
                    }
                  },
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                      fontSize: size.width * 0.04,
                      color: AppColor.white,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (button != null) button!,
            ],
          ),
        ),
        if (error != "")
          Container(
            width: double.infinity,
            margin: margin
                ? EdgeInsets.only(
                    left: size.width * 0.075,
                    top: size.height * 0.005,
                    bottom: size.height * 0.005,
                  )
                : EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.005),
            child: Text(
              error,
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: AppColor.red,
              ),
            ),
          ),
      ],
    );
  }
}
