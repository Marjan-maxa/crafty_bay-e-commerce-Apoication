import 'package:crafty_bay/app/controller/auth_controller.dart';
import 'package:crafty_bay/app/crafty_bay_app.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';

//Best Practise=> Service Locator/ Dependency Injection Manager
NetworkCaller getNetworkCaller() {
  return NetworkCaller(
    headers: () {
      final headers = {'content-type': 'application/json'};
      if (AuthController.accessToken != null) {
        headers['token'] = '${AuthController.accessToken}';
      }
      return headers;
    },
    onUnauthorized: () async {
      // log out app
      await AuthController.clearUserData();
      CraftyBayApp.navigatorKey.currentState!.pushNamed(SignInScreen.name);
    },
  );
}

// getNetworkCalller().getRequuest;
