import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.borderRaduis,
    this.fontSize,
    this.onPressed,
  });

  final Color backgroundColor;
  final Color textColor;
  final double? fontSize;
  final String text;
  final BorderRadius? borderRaduis;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRaduis ?? BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: Styles.textstyle16.copyWith(
            color: textColor,
            fontWeight: FontWeight.w900,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
