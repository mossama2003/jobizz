import 'package:flutter/material.dart';
import 'package:jobizz/core/constant/app_assets.dart';
import 'package:jobizz/features/reset_password/presentation/screens/reset_password_screen.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/helper/app_navigator.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_size.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_icon.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 52,
      height: 52,
      textStyle: const TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkGray),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.mediumSeaGreen),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: AppColors.black),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
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
            ),
            SizedBox(height: AppSize.getHeight(72)),
            Text(
              'Jôbizz',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: AppSize.font(22),
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: AppSize.getHeight(35)),
            Text(
              'Verify Code',
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
                'Enter your verification code from your email or phone number that we’ve sent',
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
            Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (s) {
                return s == '2222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
            const Spacer(),
            Padding(
              padding: AppSize.padding(
                horizontal: 24,
                bottom: 128,
              ),
              child: CustomButton(
                title: 'Verify',
                onTap: () => AppNavigator.push(const ResetPasswordScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
