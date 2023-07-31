import 'package:flutter/material.dart';

class CustomColumnText extends StatelessWidget {
  final Size size;
  final String label;
  final String points;

  const CustomColumnText({
    Key? key,
    required this.size,
    required this.label,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            letterSpacing: 0.34,
            color: const Color(0xFF666666),
            fontSize: size.width * 0.033,
          ),
        ),
        SizedBox(height: size.height * 0.006),
        Text(
          points,
          style: TextStyle(
            letterSpacing: 0.34,
            fontSize: size.width * 0.045,
          ),
        ),
      ],
    );
  }
}
