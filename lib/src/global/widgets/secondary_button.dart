import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const SecondaryButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: double.infinity,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(50)),
        height: 50,
        child: Text(text, style: AppText.buttonText2));
  }
}
