import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final Size size;
  final String name;
  const LabelText({
    Key? key,
    required this.size,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.width * 0.01),
      child: Row(
        children: [
          SizedBox(width: size.width * 0.02),
          Text(
            name,
            style: TextStyle(
              fontSize: size.width * 0.035,
              color: Color(0xff7657DE),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
