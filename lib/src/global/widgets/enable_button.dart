import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter/material.dart';

class EnabledButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const EnabledButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: double.infinity,
        onPressed: onPressed,
        color: AppColor.backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        height: 50,
        child: Text(text, style: AppText.enabledButtonText));
  }
}
