import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../shared/shared.dart';
import '../../auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authViewModel = inject<AuthViewModel>();

  final _formKey = GlobalKey<FormState>();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _authViewModel.loginState.stream.listen((state) {
      switch (state) {
        case LoadingState():
          LoadingOverlay.show(context);
        case SuccessState():
          LoadingOverlay.hide();
          context.go(NavigationRoutes.magicRoute);
        case ErrorState():
          LoadingOverlay.hide();
          ErrorOverlay.of(context).show(state.error);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(
              horizontal: AppDimens.mediumSize,
              vertical: AppDimens.semiMediumSize,
            ),
            elevation: AppDimens.cardBigElevation,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: AppDimens.bigSize),
                    Text(
                      localizations.sign_in_welcome_title,
                      style: AppStyles.extraBigTextStyle,
                    ),
                    const SizedBox(height: AppDimens.extraSmallSize),
                    Text(
                      localizations.sign_in_welcome_subtitle,
                      style: AppStyles.smallTextStyle,
                    ),
                    const SizedBox(height: AppDimens.semiBigSize),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.mediumSize,
                      ),
                      child: TextFormField(
                        controller: _emailFieldController,
                        keyboardType: TextInputType.text,
                        validator: validateEmail,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: localizations.sign_in_email,
                          hintText: localizations.sign_in_email_hint,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppDimens.mediumSize),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.mediumSize,
                      ),
                      child: PasswordFormField(
                        controller: _passwordFieldController,
                        validator: (value) => validatePassword(
                          value!,
                          _passwordFieldController,
                          _passwordFieldController,
                        ),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: localizations.sign_in_password,
                          hintText: localizations.sign_in_password_hint,
                          errorMaxLines: 3,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppDimens.semiBigSize),
                    FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          FocusManager.instance.primaryFocus
                              ?.unfocus(); // Close keyboard

                          _authViewModel.login(
                            _emailFieldController.text,
                            _passwordFieldController.text,
                          );
                        }
                      },
                      child: Text(localizations.sign_in),
                    ),
                    const SizedBox(height: AppDimens.semiBigSize),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _authViewModel.dispose(); // Avoid memory leaks
  }
}
