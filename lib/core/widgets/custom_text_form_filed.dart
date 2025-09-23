import 'package:event_app_c16_sat/core/theme/color_pallete.dart';
import 'package:event_app_c16_sat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class CustomTextFormFiled extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final bool isPassword;
  final int? maxLines;
  final String? Function(String?)? validator;

  const CustomTextFormFiled({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.maxLines,
    this.validator,
  });

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return TextFormField(
      controller: widget.controller,
      cursorColor: ColorPallete.primaryColor,
      maxLines: widget.maxLines,
      obscureText: widget.isPassword ? obscureText : false,
      style: theme.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
        color: ColorPallete.textFormFiledBorderColor,
      ),
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: ColorPallete.textFormFiledBorderColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: ColorPallete.textFormFiledBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: ColorPallete.textFormFiledBorderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.red),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            widget.isPassword
                ? Bounceable(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    color: ColorPallete.textFormFiledBorderColor,
                  ),
                )
                : null,
      ),
    );
  }
}
