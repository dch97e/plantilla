import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'Flutter MVVM';

  @override
  String get home_title => 'Home';

  @override
  String get artists_title => 'Artists';

  @override
  String get about_title => 'About';

  @override
  String about_description(Object cleanArch, Object lang) {
    return 'Flutter MVVM Example Project.\n\nDeveloped in $lang following the $cleanArch principles.';
  }

  @override
  String get sign_in => 'Sign in';

  @override
  String get sign_in_welcome_title => 'Welcome!';

  @override
  String get sign_in_welcome_subtitle => 'Enter your user data to continue';

  @override
  String get sign_in_username => 'Username';

  @override
  String get sign_in_username_hint => 'Enter your username';

  @override
  String get sign_in_password => 'Password';

  @override
  String get sign_in_password_hint => 'Enter your password';

  @override
  String get sign_out => 'Sign out';

  @override
  String get error_title => 'Error';

  @override
  String get error_default => 'An error has occurred.';

  @override
  String get error_timeout => 'We are experiencing some temporary problems. Please try again in a few moments.';

  @override
  String get error_unauthorized => 'Your session has expired and we have not been able to renew it. Please sign in again.';

  @override
  String get error_no_internet => 'There is no Internet connection. Check your Wi-Fi or mobile data connection, please.';

  @override
  String get error_server => 'We are experiencing some problems at this time. Please come back later.';

  @override
  String get error_not_found => 'We can not find what you need. Please try again later.';

  @override
  String get error_empty_field => 'This field can not be empty';

  @override
  String get error_support_code => 'Support Code';

  @override
  String get action_ok => 'OK';

  @override
  String get action_cancel => 'Cancel';

  @override
  String get action_retry => 'Retry';
}
