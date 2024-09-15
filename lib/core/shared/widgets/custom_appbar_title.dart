import 'package:flutter/material.dart';

import '../../helper/app_navigator.dart';
import '../../style/app_colors.dart';
import '../../style/app_size.dart';

class CustomAppbarTitle extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbarTitle({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => Size.fromHeight(AppSize.getHeight(70));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppSize.padding(horizontal: 32),
            child: Row(
              children: [
                InkWell(
                  onTap: () => AppNavigator.pop(),
                  child: Container(
                    width: AppSize.getSize(50),
                    height: AppSize.getSize(50),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(AppSize.getSize(15)),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: AppSize.getWidth(20)),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: AppSize.font(18),
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
