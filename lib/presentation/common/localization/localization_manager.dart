import 'package:flutter/material.dart';
import 'package:flutter_mvvm/presentation/common/localization/app_localizations.dart';

AppLocalizations get localizations => _localizations!;
AppLocalizations? _localizations;

class LocalizationManager {
  static void init({required BuildContext context}) =>
      _localizations ??= AppLocalizations.of(context);
}
