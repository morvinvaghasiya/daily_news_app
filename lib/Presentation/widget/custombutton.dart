import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Size size;
  final Function func;
  final String txt;
  const CustomButton({
    Key? key,
    required this.size,
    required this.func,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: size.width * 0.035),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff7657DE),
        ),
        child: Text(txt, style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
