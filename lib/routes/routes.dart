
import 'package:packages_mall_employer/screens/bottom_tab_screens/bottom_tab_screen.dart';
import 'package:packages_mall_employer/screens/splash_screen/splash_screen.dart';
import 'package:packages_mall_employer/screens/support_chat_screen/support_chat_screen.dart';

class Routes {
  static const String splash = '/splash';
  static const String bottomTabScreen = '/mainHomeScreen';
  static const String supportChatScreen = '/supportChatScreen';


  static final routes = {
    splash: (context) => const SplashScreen(),
    bottomTabScreen: (context) => const BottomTabScreen(),
    supportChatScreen: (context) => const SupportChatScreen(),
  };




  //
}