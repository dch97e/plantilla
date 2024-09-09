import 'package:flutter/material.dart';
import 'package:flutter_mvvm/presentation/common/errorhandling/base/error_bundle.dart';
import 'package:flutter_mvvm/presentation/common/localization/localization_manager.dart';

class ErrorOverlay {
  BuildContext _context;

  ErrorOverlay._create(this._context);

  factory ErrorOverlay.of(BuildContext context) {
    return ErrorOverlay._create(context);
  }

  void show(ErrorBundle? error,
      {VoidCallback? onRetry, bool? showSupportCode}) {
    if (error == null) {
      return;
    }

    showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: AlertDialog(
            title: Text(localizations.error_title),
            content: showSupportCode != false
                ? RichText(
                    text: TextSpan(
                    text:
                        '${error.errorMessage}\n\n${localizations.error_support_code}: ',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                    children: [
                      TextSpan(
                          text:
                              '${error.appAction.value}/${error.appError.value}',
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ))
                : Text(error.errorMessage),
            actions: [
              TextButton(
                child: Text(localizations.action_ok),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Visibility(
                visible: onRetry != null,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onRetry?.call();
                  },
                  child: Text(localizations.action_retry),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
