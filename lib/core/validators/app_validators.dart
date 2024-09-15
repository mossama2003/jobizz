import 'package:easy_localization/easy_localization.dart';

class AppValidators {
  /// REQUIRED VALIDATION
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'validators.required'.tr();
    } else {
      return null;
    }
  }

  /// REQUIRED LENGTH VALIDATION
  static String? minLength(String? value, int length) {
    if (value == null || value.isEmpty) {
      return 'validators.required'.tr();
    } else if (value.length < length) {
      return 'validators.length.min'.tr(namedArgs: {'length': '$length'});
    } else {
      return null;
    }
  }

  /// REQUIRED EXACT LENGTH VALIDATION
  static String? exactLength(String? value, int length) {
    if (value == null || value.isEmpty) {
      return 'validators.required'.tr();
    } else if (value.length != length) {
      return 'validators.length.exact'.tr(namedArgs: {'length': '$length'});
    } else {
      return null;
    }
  }

  /// EMAIL VALIDATION
  static String? email(String? email) {
    if (email == null || email.isEmpty) {
      return 'validators.email.required'.tr();
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      return 'validators.email.pattern'.tr();
    } else {
      return null;
    }
  }

  /// PASSWORD VALIDATION
  static String? password(String? password) {
    if (password == null || password.isEmpty) {
      return 'validators.password.required'.tr();
    } else if (password.length < 8) {
      return 'validators.password.min_length'.tr();
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'validators.password.contain_number'.tr();
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'validators.password.contain_upper_case'.tr();
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return 'validators.password.contain_special_char'.tr();
    } else {
      return null;
    }
  }

  /// PASSWORD IDENTICAL
  static String? passwordIdentical(String? value, String? other) {
    if (value == null || value.isEmpty) {
      return 'validators.password.required'.tr();
    } else if (value != other) {
      return 'validators.password.identical'.tr();
    } else {
      return null;
    }
  }

  /// PHONE NUMBER VALIDATION
  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'validators.phone.required'.tr();
    } else if (value[0] != '0') {
      return 'validators.phone.start_with_0'.tr();
    } else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
      return 'validators.phone.pattern'.tr();
    } else {
      return null;
    }
  }

  /// ONLY NUMBERS AND LENGTH
  static String? onlyNumbersLength(String? value, {int? length}) {
    if (value == null || value.isEmpty) {
      return 'validators.required'.tr();
    } else if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'validators.numbers.only'.tr();
    } else if (length != null && value.length != length) {
      return 'validators.numbers.exact_length'.tr(
        namedArgs: {'length': '$length'},
      );
    } else {
      return null;
    }
  }

  /// OTP VALIDATION
  static String? otp(String? value) {
    if (value == null || value.isEmpty) {
      return 'validators.OTP.required'.tr();
    } else if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'validators.OTP.length'.tr();
    } else {
      return null;
    }
  }
}
