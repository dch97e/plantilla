import 'package:flutter/material.dart';
import 'package:flutter_mvvm/core/di/app_modules.dart';
import 'package:flutter_mvvm/presentation/navigation/navigation_routes.dart';
import 'package:flutter_mvvm/presentation/view/auth/viewmodel/auth_view_model.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _authViewModel = inject<AuthViewModel>();

  @override
  void initState() {
    super.initState();

    _authViewModel.authenticatedState.stream.listen((state) {
      switch (state) {
        case true:
          context.go(NavigationRoutes.artistsRoute);
          break;
        case false:
          context.go(NavigationRoutes.loginRoute);
          break;
      }
    });

    _authViewModel.isAuthenticated();
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
    _authViewModel.dispose(); // Avoid memory leaks
  }
}
