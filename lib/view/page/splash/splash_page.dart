import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view/common/widget_extensions.dart';
import 'package:flutter_mvvm/view/page/auth/login_page.dart';
import 'package:flutter_mvvm/view/page/home/home_page.dart';
import 'package:flutter_mvvm/view/viewmodel/auth_view_model.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthViewModel viewModel = AuthViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.authenticatedState.stream.listen((state) {
      switch (state) {
        case true:
          context.navigateReplacing(const HomePage());
          break;
        case false:
          context.navigateReplacing(const LoginPage());
          break;
      }
    });

    viewModel.isAuthenticated();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(), // Empty page
    );
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.dispose(); // Avoid memory leaks
  }
}
