import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg({
    super.key,
    this.width,
    this.color,
    this.height,
    required this.svg,
  });

  final String svg;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(
        svg,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      ),
    );
  }
}
