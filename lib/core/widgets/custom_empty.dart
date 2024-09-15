import 'package:flutter/material.dart';

import '../style/app_size.dart';
import 'custom_svg.dart';

class CustomEmpty extends StatelessWidget {
  const CustomEmpty({
    super.key,
    this.svg,
    this.text,
    this.image,
    this.title,
    this.topSpace,
  });

  final String? svg;
  final String? text;
  final String? title;
  final String? image;
  final double? topSpace;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: AppSize.getHeight(topSpace ?? 125)),
          if (image != null)
            Image.asset(image!, height: AppSize.getHeight(260)),
          if (svg != null)
            CustomSvg(svg: svg!, height: AppSize.getHeight(260)),
          if (title != null) ...[
            SizedBox(height: AppSize.getHeight(24)),
            Text(
              title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppSize.font(24),
              ),
            ),
          ],
          if (text != null) ...[
            SizedBox(
              height: title != null
                  ? AppSize.getHeight(6)
                  : AppSize.getHeight(24),
            ),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: AppSize.font(15),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
