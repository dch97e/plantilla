import 'package:flutter/material.dart';
import 'package:flutter_mvvm/di/app_modules.dart';
import 'package:flutter_mvvm/presentation/common/localization/localization.dart';
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
  final viewModel = inject<AuthViewModel>();

  @override
  void initState() {
    super.initState();

    viewModel.signOutState.stream.listen((state) {
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
        title: Text(Localization.of(context).string('about_title')),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimens.mediumMargin),
            child: Text(
                Localization.of(context).string('about_description',
                    params: ['Dart', 'Clean Architecture']),
                textAlign: TextAlign.center),
          ),
          ElevatedButton(
            onPressed: () {
              viewModel.signOut();
            },
            child: Text(Localization.of(context)
                .string('sign_out', params: ['OK', 'KO'])),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.dispose(); // Avoid memory leaks
  }

  @override
  bool get wantKeepAlive => true;
}
