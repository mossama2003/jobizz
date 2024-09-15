import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../shared/controllers/theme/theme_cubit.dart';
import '../style/app_colors.dart';
import '../style/app_size.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    this.onTap,
    this.width,
    this.color,
    this.height,
    this.bgColor,
    this.padding,
    this.borderColor,
    this.borderRadius,
    required this.icon,
    this.withColor = false,
  });

  final String icon;
  final Color? color;
  final double? width;
  final bool withColor;
  final Color? bgColor;
  final double? height;
  final Function()? onTap;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius,
          shape: borderRadius != null ? BoxShape.rectangle : BoxShape.circle,
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                  width: AppSize.getSize(1),
                )
              : null,
        ),
        padding: borderColor != null || bgColor != null
            ? padding ?? AppSize.padding(all: 5)
            : null,
        child: SizedBox(
          width: width ?? AppSize.getSize(25),
          height: height ?? AppSize.getSize(25),
          child: SvgPicture.asset(
            icon,
            colorFilter: withColor
                ? null
                : ColorFilter.mode(
                    color ??
                        (ThemeCubit.get(context).isDark
                            ? AppColors.white
                            : AppColors.white),
                    BlendMode.srcIn,
                  ),
          ),
        ),
      ),
    );
  }
}
