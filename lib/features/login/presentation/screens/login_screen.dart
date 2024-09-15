import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobizz/core/style/app_colors.dart';
import 'package:jobizz/core/custom_widgets/custom_text_form_field.dart';
import 'package:jobizz/core/widgets/custom_icon.dart';
import 'package:jobizz/features/forget_password/presentation/screens/forget_password_screen.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/helper/app_navigator.dart';
import '../../../../core/style/app_size.dart';
import '../../../../core/validators/app_validators.dart';
import '../../../../core/widgets/custom_button.dart';

class Visibility {
  static bool isVisible = true;

  static void changeVisibility() {
    isVisible = !isVisible;
  }
}

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  void changeVisibility() {
    setState(() {
      Visibility.changeVisibility();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
              SizedBox(height: AppSize.getHeight(23)),
              Padding(
                padding: AppSize.padding(
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSize.getHeight(21)),
                    Text(
                      'Jôbizz',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: AppSize.font(22),
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: AppSize.getHeight(8)),
                    Text(
                      'Welcome Back 👋',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: AppSize.font(24),
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: AppSize.getHeight(7)),
                    Text(
                      'Let’s log in. Apply to jobs!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: AppSize.font(14),
                        color: AppColors.darkGray,
                      ),
                    ),
                    SizedBox(height: AppSize.getHeight(51)),
                    CustomTextFormField(
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
                    SizedBox(height: AppSize.getHeight(16)),
                    CustomTextFormField(
                      hint: 'Password',
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
                    SizedBox(height: AppSize.getHeight(32)),
                    CustomButton(
                      title: 'Log in',
                      onTap: () {},
                    ),
                    SizedBox(height: AppSize.getHeight(40)),
                    GestureDetector(
                      onTap: () => AppNavigator.push(
                        const ForgetPasswordScreen(),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: AppSize.font(15),
                            fontFamily: 'Circular Std',
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.getHeight(49)),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            height: 0.5,
                            color: AppColors.darkGray,
                            indent: 5,
                            endIndent: 10,
                          ),
                        ),
                        Text(
                          'Or continue with',
                          style: TextStyle(
                            fontSize: AppSize.font(13),
                            fontFamily: 'Circular Std',
                            color: AppColors.darkGray,
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            height: 0.5,
                            color: AppColors.darkGray,
                            indent: 10,
                            endIndent: 5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.getHeight(48)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: AppSize.getSize(56),
                            height: AppSize.getSize(56),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius:
                                    BorderRadius.circular(AppSize.getSize(50)),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black.withOpacity(0.1),
                                    spreadRadius: 0,
                                    blurRadius: 20,
                                    offset: const Offset(0, 4),
                                  )
                                ]),
                            child: Center(
                              child: CustomIcon(
                                icon: AppIcons.apple,
                                withColor: true,
                                width: AppSize.getSize(26),
                                height: AppSize.getSize(26),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: AppSize.getWidth(24)),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: AppSize.getSize(56),
                            height: AppSize.getSize(56),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.circular(AppSize.getSize(50)),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.black.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 20,
                                  offset: const Offset(0, 4),
                                )
                              ],
                            ),
                            child: Center(
                              child: CustomIcon(
                                icon: AppIcons.google,
                                withColor: true,
                                width: AppSize.getSize(26),
                                height: AppSize.getSize(26),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: AppSize.getWidth(24)),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: AppSize.getSize(56),
                            height: AppSize.getSize(56),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.black.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 20,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: CustomIcon(
                                icon: AppIcons.facebook,
                                withColor: true,
                                width: AppSize.getSize(26),
                                height: AppSize.getSize(26),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.getHeight(48)),
                    GestureDetector(
                      onTap: () => AppNavigator.pop(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Haven’t an account? ',
                            style: TextStyle(
                              fontSize: AppSize.font(14),
                              fontFamily: 'Circular Std',
                              color: AppColors.silver,
                            ),
                          ),
                          Text(
                            'Register',
                            style: TextStyle(
                              fontSize: AppSize.font(14),
                              fontFamily: 'Circular Std',
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
