import 'package:crafty_bay/core/network_caller/network_caller.dart';
//Best Practise=> Service Locator/ Dependency Injection Manager
NetworkCaller getNetworkCaller()
{
  return NetworkCaller(headers: ()=> {  },
    onUnauthorized: () {
    // log out app
      // clear data
      // navigate to login screen
    },

);
}

// getNetworkCalller().getRequuest;

