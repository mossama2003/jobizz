import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobizz/core/custom_widgets/custom_text_form_field.dart';
import 'package:jobizz/core/validators/app_validators.dart';
import 'package:jobizz/core/widgets/custom_icon.dart';
import 'package:jobizz/features/verification/presentation/screens/verify_screen.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/custom_widgets/custom_text_number_form_field.dart';
import '../../../../core/helper/app_navigator.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_size.dart';
import '../../../../core/widgets/custom_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  int selectedIndex = 0;
  String selectedCountryCode = '+1';
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: AppSize.padding(
                top: 20,
                start: 25,
              ),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomIcon(
                  icon: AppIcons.backArrow,
                  withColor: true,
                  width: AppSize.getSize(24),
                  height: AppSize.getSize(24),
                  onTap: () => AppNavigator.pop(),
                ),
              ),
            ),
            SizedBox(height: AppSize.getHeight(23)),
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
            Padding(
              padding: AppSize.padding(horizontal: 35),
              child: Column(
                children: [
                  Text(
                    'Forget Password',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.font(24),
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: AppSize.getHeight(17)),
                  Text(
                    'Enter your email or phone number, we will send you verification code',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: AppSize.font(14),
                      color: AppColors.darkGray.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: AppSize.getWidth(281),
              height: AppSize.getHeight(48),
              decoration: BoxDecoration(
                color: AppColors.lightGrayishBlue,
                borderRadius: BorderRadius.circular(AppSize.getSize(16)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      selectedIndex = 0;
                    }),
                    child: Container(
                      width: AppSize.getWidth(134.5),
                      height: AppSize.getHeight(36),
                      decoration: BoxDecoration(
                        color: selectedIndex == 0
                            ? AppColors.white
                            : AppColors.lightGrayishBlue,
                        borderRadius:
                            BorderRadius.circular(AppSize.getSize(16)),
                      ),
                      child: Center(
                        child: Text(
                          'E-mail',
                          style: TextStyle(
                            fontSize: AppSize.font(13),
                            fontFamily: 'Circular Std',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: AppSize.getWidth(4)),
                  GestureDetector(
                    onTap: () => setState(() {
                      selectedIndex = 1;
                    }),
                    child: Container(
                      width: AppSize.getWidth(134.5),
                      height: AppSize.getHeight(36),
                      decoration: BoxDecoration(
                        color: selectedIndex == 1
                            ? AppColors.white
                            : AppColors.lightGrayishBlue,
                        borderRadius:
                            BorderRadius.circular(AppSize.getSize(16)),
                      ),
                      child: Center(
                        child: Text(
                          'Mobile Number',
                          style: TextStyle(
                            fontSize: AppSize.font(13),
                            fontFamily: 'Circular Std',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.getHeight(40)),

            /// If For E-mail
            if (selectedIndex == 0)
              Padding(
                padding: AppSize.padding(horizontal: 24),
                child: CustomTextFormField(
                  hint: 'E-mail',
                  validator: (val) => AppValidators.email(val),
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: AppSize.font(14),
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGray,
                  ),
                  greyIcon: SvgPicture.asset(
                    AppIcons.emailGrey,
                    fit: BoxFit.scaleDown,
                  ),
                  blackIcon: SvgPicture.asset(
                    AppIcons.emailBlack,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),

            /// If For Mobile Number
            if (selectedIndex == 1)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.getHeight(24),
                ),
                child: CustomTextNumberFormField(
                  hint: 'Mobile Number',
                  validator: (val) => AppValidators.phoneNumber(val),
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: AppSize.font(14),
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGray,
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
                title: 'Send code',
                onTap: () => AppNavigator.push(
                  const VerifyScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
