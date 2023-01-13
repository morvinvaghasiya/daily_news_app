import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFild extends StatelessWidget {
  final Size size;
  final String hint;
  final bool cngsize;
  final bool obsertext;
  final TextEditingController controller;
  final Function? onChange;
  final List<TextInputFormatter>? inputFormatter;

  const CustomTextFild({
    Key? key,
    required this.size,
    required this.hint,
    required this.controller,
    this.cngsize = false,
    this.onChange,
    this.obsertext = false,
    this.inputFormatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.01, horizontal: size.width * 0.02),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(0.6),
          ),
        ],
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white70, width: 2),
      ),
      child: TextField(
        autofocus: false,
        autocorrect: true,
        autofillHints: const [AutofillHints.countryCode],
        keyboardType: TextInputType.emailAddress,
        inputFormatters: inputFormatter,
        obscureText: obsertext,
        controller: controller,
        style: const TextStyle(
          fontSize: 18,
          color: Color(0xff7053DE),
        ),
        onChanged: (String value) {
          if (onChange != null) {
            onChange!();
          }
        },
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 18,
            color: Colors.black45,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
