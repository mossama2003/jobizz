import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_size.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, this.space, this.onRefresh});

  final double? space;
  final Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRefresh,
      child: Column(
        children: [
          SizedBox(height: space ?? AppSize.getHeight(75)),
          // CustomSvg(svg: AppSvg.error, height: AppSize.getHeight(225)),
          SizedBox(height: AppSize.getHeight(30)),
          Text(
            'failure.unexpected_error'.tr(),
            style: const TextStyle(fontWeight: FontWeight.bold, height: 1.8),
            textAlign: TextAlign.center,
          ),
          if (onRefresh != null) ...[
            SizedBox(height: AppSize.getHeight(30)),
            InkWell(
              onTap: onRefresh,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryColor.withOpacity(.2),
                ),
                padding: AppSize.padding(vertical: 8, horizontal: 16),
                child: Text(
                  'failure.refresh'.tr(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ],
      ),
    );
  }
}
