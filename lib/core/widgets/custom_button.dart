import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_size.dart';
import 'custom_icon.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.icon,
    this.onTap,
    this.width,
    this.height,
    this.bgColor,
    this.textColor,
    this.borderColor,
    required this.title,
    this.loading = false,
  });

  final String title;
  final bool loading;
  final String? icon;
  final double? width;
  final double? height;
  final Color? bgColor;
  final Color? textColor;
  final Function()? onTap;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onTap,
      borderRadius: BorderRadius.circular(AppSize.getSize(5)),
      child: Container(
        width: width ?? double.infinity,
        height: height ?? AppSize.getHeight(56),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.getSize(5)),
          color: loading ? AppColors.darkGray : (bgColor ?? AppColors.primaryColor),
          border: borderColor != null && !loading
              ? Border.all(width: 1.5, color: borderColor!)
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading)
              SizedBox(
                width: AppSize.getSize(26),
                height: AppSize.getSize(26),
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.white,
                ),
              ),
            if (!loading) ...[
              if (icon != null) ...[
                CustomIcon(
                  icon: icon!,
                  height: AppSize.getHeight(24),
                  width: AppSize.getWidth(35),
                  color: textColor ?? AppColors.white,
                ),
                SizedBox(width: AppSize.getWidth(15)),
              ],
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: AppSize.font(16),
                  color: textColor ?? AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
