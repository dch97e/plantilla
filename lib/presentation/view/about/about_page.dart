import 'package:flutter/material.dart';
import 'package:flutter_mvvm/core/di/app_modules.dart';
import 'package:flutter_mvvm/presentation/common/localization/localization_manager.dart';
import 'package:flutter_mvvm/presentation/common/resources/app_dimens.dart';
import 'package:flutter_mvvm/presentation/navigation/navigation_routes.dart';
import 'package:flutter_mvvm/presentation/view/auth/viewmodel/auth_view_model.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with AutomaticKeepAliveClientMixin {
  final _authViewModel = inject<AuthViewModel>();

  @override
  void initState() {
    super.initState();

    _authViewModel.signOutState.stream.listen((state) {
      switch (state) {
        case true:
          context.go(NavigationRoutes.initialRoute);
          break;
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
          Padding(
            padding: const EdgeInsets.all(AppDimens.mediumMargin),
            child: Text(
                localizations.about_description('Clean Architecture', 'Dart'),
                textAlign: TextAlign.center),
          ),
          ElevatedButton(
            onPressed: () {
              _authViewModel.signOut();
            },
            child: Text(localizations.sign_out),
          )
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
