import 'package:at_onboarding_flutter/services/onboarding_service.dart';
import 'package:attached/app/themes.dart';
import 'package:attached/services/getIt.dart';
import 'package:attached/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mullr_components/features/navigating/basic_navigator_observer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:collection/collection.dart';

import 'app/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies(); // Creates all necessary services for get_it
  await Hive.initFlutter();
  await initializeServices();
  await ThemeManager.initialise();

  runApp(AppView());
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
      viewModelBuilder: () => AppViewModel(),
      onModelReady: (model) async {
        //await model.initialize();
      },
      builder: (context, model, child) {

        return model.isBusy ? Center(
          child: CircularProgressIndicator(),
        ): ThemeBuilder(
          defaultThemeMode: ThemeMode.light,
          lightTheme: friendTheme,
          darkTheme: darkTheme,
          builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (context, nativeNavigator) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Portal(
                    child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  themeMode: ThemeMode.system,
                  theme: lightTheme,
                  routerDelegate: appRouter.delegate(
                    navigatorObservers: () {
                      return [
                        if (kDebugMode) BasicNavigatorObserver(),
                      ];
                    },
                  ),
                  routeInformationParser: appRouter.defaultRouteParser(),
                )),
              );
            },
          ),
        );
      },
    );
  }
}

class AppViewModel extends BaseViewModel {
  Future<void> initialize() async {

  }
}
