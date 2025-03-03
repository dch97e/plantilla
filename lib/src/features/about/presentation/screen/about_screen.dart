import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../../shared/shared.dart';
import '../../../auth/auth.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with AutomaticKeepAliveClientMixin {
  final _authViewModel = inject<AuthViewModel>();

  @override
  void initState() {
    super.initState();

    _authViewModel.signOutState.stream.listen((state) {
      switch (state) {
        case true:
          context.go(NavigationRoutes.initialRoute);
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.about_title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.mediumSize),
              child: Text(
                localizations.about_description('Clean Architecture', 'Dart'),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _authViewModel.signOut,
            child: Text(localizations.sign_out),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _authViewModel.dispose(); // Avoid memory leaks
  }

  @override
  bool get wantKeepAlive => true;
}
