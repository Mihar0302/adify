import 'package:adify/presentation/widgets/string_stream.dart';
import 'package:flutter/material.dart';
import '../../utils/app_color.dart';

class CustomDropDownList extends StatelessWidget {
  final StringStream stringstrem;
  final String dropbtntext;
  final List<String> list;
  final Function ontap;
  final Color color;

  const CustomDropDownList({
    Key? key,
    required this.stringstrem,
    required this.dropbtntext,
    required this.list,
    required this.ontap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: StreamBuilder<String>(
            stream: stringstrem.stream,
            initialData: null,
            builder: (context, waysnap) {
              return DropdownButton(
                  menuMaxHeight: size.height * 0.3,
                  isExpanded: true,
                  autofocus: false,
                  value: waysnap.data,
                  hint: Text(
                    dropbtntext,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  icon: Icon(Icons.keyboard_arrow_down, color: AppColor.black),
                  items: list.map((String e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * 0.04,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? val) {
                    ontap(val);
                  });
            }),
      ),
    );
  }
}
