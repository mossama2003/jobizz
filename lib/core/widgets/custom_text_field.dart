import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_size.dart';
import 'custom_icon.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    required this.controller,
    this.onSubmit,
    this.onChanged,
    this.iconStart,
    this.iconEnd,
    this.iconEndTap,
    this.minLines = 1,
    this.maxLines = 1,
    this.enabled = true,
    this.validator,
    this.iconColor = false,
    this.autofocus = false,
    this.obscureText = false,
    this.textColor = AppColors.primaryColor,
    this.keyboardType = TextInputType.text,
  });

  final TextInputType keyboardType;
  final TextEditingController controller;

  final bool iconColor;
  final String? iconStart;
  final String? iconEnd;
  final Function()? iconEndTap;

  final String? labelText;
  final String? hintText;
  final Color textColor;
  final bool obscureText;

  final int minLines;
  final int maxLines;
  final bool enabled;
  final bool autofocus;

  final Function(String)? onSubmit;
  final Function(String)? onChanged;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        enabled: enabled,
        minLines: minLines,
        maxLines: maxLines,
        autofocus: autofocus,
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText,
        onFieldSubmitted: onSubmit,
        keyboardType: keyboardType,
        style: TextStyle(
          height: 1.7,
          fontWeight: FontWeight.w600,
          fontSize: AppSize.font(14),
        ),
        validator: validator ?? (val) => null,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText ?? '',
          prefixIcon: iconStart != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIcon(
                      icon: iconStart!,
                      withColor: iconColor,
                      color: iconColor ? null : AppColors.darkGray,
                    ),
                  ],
                )
              : null,
          suffixIcon: iconEnd != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIcon(
                      icon: iconEnd!,
                      onTap: iconEndTap,
                      withColor: iconColor,
                      color: iconColor ? null : AppColors.darkGray,
                    ),
                  ],
                )
              : null,
        ),
      ),
    );
  }
}
