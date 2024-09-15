import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobizz/core/constant/app_assets.dart';

import '../../../../core/custom_widgets/custom_text_form_field.dart';
import '../../../../core/helper/app_navigator.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_size.dart';
import '../../../../core/validators/app_validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_icon.dart';

class Visibility {
  static bool isVisible = true;

  static void changeVisibility() {
    isVisible = !isVisible;
  }
}

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  void changeVisibility() {
    setState(() {
      Visibility.changeVisibility();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppSize.padding(
                top: 20,
                start: 25,
              ),
              child: CustomIcon(
                withColor: true,
                icon: AppIcons.backArrow,
                width: AppSize.getSize(24),
                height: AppSize.getSize(24),
                onTap: () => AppNavigator.pop(),
              ),
            ),
            SizedBox(height: AppSize.getHeight(65)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Jôbizz',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.font(22),
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: AppSize.getHeight(21)),
                  Text(
                    'Reset Password',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.font(24),
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: AppSize.getHeight(17)),
                  Padding(
                    padding: AppSize.padding(horizontal: 32),
                    child: Text(
                      'Enter your new password and confirm the new password to reset password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: AppSize.font(14),
                        color: AppColors.darkGray,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomTextFormField(
                      hint: 'New Password',
                      validator: (val) => AppValidators.password(val),
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: AppSize.font(14),
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkGray,
                      ),
                      secureText: Visibility.isVisible,
                      greyIcon: SvgPicture.asset(
                        AppIcons.passwordGrey,
                        fit: BoxFit.scaleDown,
                      ),
                      blackIcon: SvgPicture.asset(
                        AppIcons.passwordBlack,
                        fit: BoxFit.scaleDown,
                      ),
                      suffix: GestureDetector(
                        onTap: () => changeVisibility(),
                        child: SvgPicture.asset(
                          Visibility.isVisible
                              ? AppIcons.visibility
                              : AppIcons.visibilityOff,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.getHeight(16)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomTextFormField(
                      hint: 'Confirm New Password',
                      validator: (val) => AppValidators.password(val),
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: AppSize.font(14),
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkGray,
                      ),
                      secureText: Visibility.isVisible,
                      greyIcon: SvgPicture.asset(
                        AppIcons.passwordGrey,
                        fit: BoxFit.scaleDown,
                      ),
                      blackIcon: SvgPicture.asset(
                        AppIcons.passwordBlack,
                        fit: BoxFit.scaleDown,
                      ),
                      suffix: GestureDetector(
                        onTap: () => changeVisibility(),
                        child: SvgPicture.asset(
                          Visibility.isVisible
                              ? AppIcons.visibility
                              : AppIcons.visibilityOff,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                      left: AppSize.getWidth(24),
                      right: AppSize.getWidth(24),
                      bottom: AppSize.getHeight(47),
                    ),
                    child: CustomButton(
                      title: 'Reset Password',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
