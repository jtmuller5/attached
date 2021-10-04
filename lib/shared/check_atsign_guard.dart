import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:attached/app/app_router.dart';
import 'package:attached/app/app_router.gr.dart';
import 'package:attached/services/services.dart';
import 'package:auto_route/auto_route.dart';

/// Push user to SignInView if logged out
/// Otherwise push to next view
class CheckAtsignGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
   // String? loggedInAtsign = await atProtocolService.keyChainManager.getAtSign();

    String? currentAtSign = AtClientManager.getInstance().atClient?.getCurrentAtSign();

    print('Current At Sign: '+ currentAtSign.toString());
    if (currentAtSign != null) {
      resolver.next(true);
    } else {
      await appRouter.push(const SignInViewRoute());
    }
  }
}