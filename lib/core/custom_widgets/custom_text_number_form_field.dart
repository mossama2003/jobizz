import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobizz/core/constant/app_assets.dart';

import '../style/app_colors.dart';

class CustomTextNumberFormField extends StatefulWidget {
  const CustomTextNumberFormField({
    super.key,
    this.controller,
    this.validator,
    this.fillColor,
    this.isFilled,
    this.tapPrefix,
    this.prefix,
    this.suffix,
    required this.hint,
    required this.hintStyle,
  });

  final String hint;
  final TextStyle hintStyle;
  final Color? fillColor;
  final bool? isFilled;
  final Widget? prefix;
  final Widget? tapPrefix;
  final Widget? suffix;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  @override
  State<CustomTextNumberFormField> createState() =>
      _CustomTextNumberFormFieldState();
}

class _CustomTextNumberFormFieldState extends State<CustomTextNumberFormField> {
  final TextEditingController _controller = TextEditingController();
  Color borderColor = AppColors.darkGray;
  List<dynamic> _countryCodes = [];
  String _selectedCountryCode = '+1';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _checkTextField(_controller.text);
    });
    if(_countryCodes.isEmpty) {
      _getCountryCodes();
    }
  }

  Future<void> _getCountryCodes() async {
    try {
      final response =
          await rootBundle.loadString('assets/country_codes/phone.json');
      final List<dynamic> data = await json.decode(response);
      setState(() {
        _countryCodes = data;
        _selectedCountryCode =
            data[0]['dial_code']; // Default to the first country code
      });
    } catch (e) {
      debugPrint('Error reading or parsing the JSON file: $e');
    }
  }

  void _checkTextField(String text) {
    setState(() {
      borderColor = text.isEmpty ? AppColors.darkGray : AppColors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onChanged: (text) {
        _checkTextField(text);
      },
      controller: widget.controller,
      validator: widget.validator ?? (val) => null,
      decoration: InputDecoration(
        fillColor: widget.fillColor,
        filled: widget.isFilled,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20, right: 16),
          child: Container(
            padding: const EdgeInsets.only(right: 8.0),
            constraints: const BoxConstraints(
              maxHeight: 48.0,
            ),
            /// Block Builder
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton<String>(
                  icon: SvgPicture.asset(AppIcons.downArrow),
                  value: _selectedCountryCode,
                  items: _countryCodes
                      .map<DropdownMenuItem<String>>((dynamic value) {
                    return DropdownMenuItem<String>(
                      value: value['dial_code'],
                      child: Row(
                        children: [
                          Text(value['emoji']),
                          const SizedBox(width: 10),
                          Text(
                            value['dial_code'],
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCountryCode = newValue!;
                    });
                  },
                  underline: Container(),
                ),
                const SizedBox(width: 16),
                const VerticalDivider(
                  color: AppColors.lightGray,
                  indent: 14,
                  endIndent: 14,
                  width: 2,
                  thickness: 2,
                ),
              ],
            ),
          ),
        ),
        prefixIconColor: Colors.grey,
        suffixIcon: widget.suffix,
        hintStyle: widget.hintStyle,
        hintText: widget.hint,

        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),

        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkGray),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),

        //---------
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkGray),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      style: const TextStyle(
        height: 1,
        fontSize: 14,
        color: AppColors.black,
        // color: AppColors.mediumSeaGreen,
      ),
    );
  }
}
