import 'package:event_app_c16_sat/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? buttonText;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? child;

  const CustomButtonWidget({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.backgroundColor,
    this.textColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 10),
        backgroundColor: backgroundColor ?? ColorPallete.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: ColorPallete.primaryColor),
        ),
      ),
      child:
          child ??
          Text(
            buttonText ?? "",
            style: theme.textTheme.titleLarge?.copyWith(
              color: textColor ?? Colors.white,
            ),
          ),
    );
  }
}
