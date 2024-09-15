// import 'package:flutter/material.dart';
// import '../style/app_colors.dart';
//
// class CustomTextButton extends StatelessWidget {
//   const CustomTextButton({
//     super.key,
//     required this.text,
//     this.bgColor,
//     required this.onTap,
//     this.radius,
//   });
//
//   final String text;
//   final Color? bgColor;
//   final Function() onTap;
//   final double? radius;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       onPressed: onTap,
//       height: 56,
//       minWidth: double.infinity,
//       color: bgColor ?? AppColors.primaryColor,
//       textColor: Colors.white,
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(radius!))),
//       child: Text(
//         text,
//         style: const TextStyle(
//           fontFamily: 'Poppins',
//           fontWeight: FontWeight.w400,
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
// }
