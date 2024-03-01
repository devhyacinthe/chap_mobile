import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool isObscureText;
  final String? obscuringCharacter;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final String? Function(String?)? validator;

  const CustomTextField(
      {Key? key,
      required this.validator,
      required this.maxLength,
      required this.controller,
      required this.keyboardType,
      required this.isObscureText,
      required this.obscuringCharacter,
      required this.suffixIcon,
      required this.prefixIcon,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return TextFormField(
      validator: validator,
      maxLength: maxLength,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscureText,
      obscuringCharacter: obscuringCharacter!,
      style: const TextStyle(
          fontFamily: 'Roboto',
          color: AppColor.backgroundTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 16),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 15, left: 0),
        constraints: BoxConstraints(maxHeight: height * 0.1, maxWidth: width),
        filled: true,
        enabled: true,
        fillColor: AppColor.backgroundColor,
        hintText: hintText,
        hintStyle: const TextStyle(
            fontFamily: 'Roboto',
            color: AppColor.backgroundTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 16),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: AppColor.primaryColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: AppColor.primaryColor, width: 1.0),
        ),
      ),
    );
  }
}
