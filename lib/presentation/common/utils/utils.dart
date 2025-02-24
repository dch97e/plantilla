import 'package:flutter/material.dart';
import 'package:flutter_mvvm/presentation/common/localization/localization_manager.dart';

String? validateEmail(String? value) {
  final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (value == null || value.isEmpty) {
    return localizations.error_empty_field;
  } else if (!emailRegex.hasMatch(value)) {
    return localizations.error_email;
  }
  return null;
}

String? validatePassword(
    String value,
    TextEditingController passwordFieldController,
    TextEditingController passwordFieldController2) {
  RegExp regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+?\-=\[\]{}|\\]).{8,}$');
  if (value.isEmpty) {
    return localizations.error_empty_field;
  } else if (!regex.hasMatch(value)) {
    return localizations.error_reset_password;
  } else if (passwordFieldController.text != passwordFieldController2.text) {
    return localizations.error_password_not_match;
  }
  return null;
}
