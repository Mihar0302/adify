import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:adify/utils/app_color.dart';

class CustomTextFild extends StatelessWidget {
  final Size size;
  final String hint;
  final bool whit;
  final bool cngsize;
  final String? Function(String?)? validator;
  final bool margin;
  final bool max;
  final bool obsertext;
  final int? maxLines;
  final Function(String)? onChanged;
  final TextEditingController controller;

  final Widget? button;
  final bool numberKeyboard;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? inputType;
  final String label;
  final Widget? location;

  const CustomTextFild({
    Key? key,
    required this.size,
    required this.hint,
    this.onChanged,
    this.whit = false,
    this.cngsize = false,
    this.margin = false,
    this.max = false,
    this.obsertext = false,
    this.maxLines,
    required this.controller,
    this.button,
    this.numberKeyboard = false,
    this.inputFormatter,
    this.inputType,
    this.label = "",
    this.validator,
    this.location,
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
              ? EdgeInsets.symmetric(horizontal: size.width * 0.06)
              : EdgeInsets.symmetric(horizontal: size.width * 0.01),
          padding: max
              ? EdgeInsets.symmetric(horizontal: size.width * 0.01)
              : EdgeInsets.symmetric(
                  horizontal: size.width * 0.03,
                  vertical: button != null
                      ? size.height * 0.01
                      : size.height * 0.018),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
                color: whit ? AppColor.white : Colors.white12, width: 2),
          ),
          child: Row(
            children: [
              if (location != null) location!,
              Expanded(
                child: TextFormField(
                  autofocus: false,
                  validator: validator,
                  autocorrect: true,
                  autofillHints: const [AutofillHints.countryCode],
                  keyboardType: numberKeyboard
                      ? TextInputType.number
                      : TextInputType.emailAddress,
                  inputFormatters: inputFormatter,
                  obscureText: obsertext,
                  maxLines: maxLines ?? 1,
                  textAlign: cngsize ? TextAlign.center : TextAlign.start,
                  controller: controller,
                  style: TextStyle(
                    letterSpacing: 0.34,
                    fontSize: size.height * 0.020,
                    color: AppColor.textBlackColor,
                  ),
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                      letterSpacing: 0.34,
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.w400,
                      color: AppColor.textGreyColor.withOpacity(0.5),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    isDense: true,
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (button != null) button!,
            ],
          ),
        ),
      ],
    );
  }
}

class CustomTextFild2 extends StatelessWidget {
  final Size size;
  final String hint;
  final bool whit;
  final bool cngsize;
  final bool margin;
  final bool max;
  final bool obsertext;
  final TextEditingController controller;
  final Function? onChange;
  final void Function()? onTapClose;
  final Widget? button;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? inputType;
  final String label;
  final Widget? prefix;

  final TextStyle textStyle;

  const CustomTextFild2({
    Key? key,
    required this.size,
    required this.hint,
    required this.controller,
    this.whit = false,
    this.cngsize = false,
    this.margin = false,
    this.onChange,
    this.max = false,
    this.obsertext = false,
    this.button,
    this.keyboardType,
    this.inputFormatter,
    this.inputType,
    this.label = "",
    this.prefix,
    this.onTapClose,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.069,
      alignment: Alignment.bottomCenter,
      margin: margin
          ? EdgeInsets.symmetric(horizontal: size.width * 0.06)
          : EdgeInsets.symmetric(horizontal: size.width * 0.01),
      padding: max
          ? EdgeInsets.symmetric(horizontal: size.width * 0.01)
          : EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: size.height * 0.018),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            spreadRadius: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
        ],
        color: AppColor.white,
        borderRadius: BorderRadius.circular(6),
        border:
            Border.all(color: whit ? AppColor.white : Colors.white12, width: 2),
      ),
      child: TextField(
        autofocus: false,
        autocorrect: true,
        autofillHints: const [AutofillHints.countryCode],
        keyboardType: keyboardType,
        inputFormatters: inputFormatter,
        obscureText: obsertext,
        maxLines: max ? 10 : 1,
        textAlignVertical: TextAlignVertical.center,
        textAlign: cngsize ? TextAlign.center : TextAlign.start,
        controller: controller,
        style: textStyle,
        onChanged: (String value) {
          if (onChange != null) {
            onChange!();
          }
        },
        decoration: InputDecoration(
          prefix: prefix,
          hintText: hint,
          // prefixIconConstraints: BoxConstraints(maxWidth: 20, maxHeight: 20),
          hintStyle: const TextStyle(
            letterSpacing: 0.34,
            fontSize: 15,
            color: Colors.black45,
          ),
          contentPadding: EdgeInsets.zero,
          isDense: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
// SizedBox(width: controller.text.isEmpty ? 0.0 : size.width * 0.2),
// controller.text.isEmpty
//     ? const SizedBox.shrink()
//     : InkWell(
//         onTap: onTapClose,
//         child: Icon(Icons.close, color: AppColor.textGreyColor),
//       )
