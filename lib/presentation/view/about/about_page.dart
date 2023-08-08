import 'package:flutter/material.dart';
import 'package:flutter_mvvm/di/app_modules.dart';
import 'package:flutter_mvvm/presentation/common/localization/app_localizations.dart';
import 'package:flutter_mvvm/presentation/common/resources/app_dimens.dart';
import 'package:flutter_mvvm/presentation/navigation/navigation_routes.dart';
import 'package:flutter_mvvm/presentation/view/auth/viewmodel/auth_view_model.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

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
        title: Text(AppLocalizations.of(context)!.about_title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimens.mediumMargin),
            child: Text(
                AppLocalizations.of(context)!
                    .about_description('Clean Architecture', 'Dart'),
                textAlign: TextAlign.center),
          ),
          ElevatedButton(
            onPressed: () {
              _authViewModel.signOut();
            },
            child: Text(AppLocalizations.of(context)!.sign_out),
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
