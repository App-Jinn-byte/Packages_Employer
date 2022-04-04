



import '../screens/auth_screens/forgot_pasword_screen/forgot_password_screen.dart';
import '../screens/auth_screens/login_screen/login_screen.dart';
import '../screens/auth_screens/signup_screen/signup_screen.dart';
import '../screens/bottom_tab_screens/bottom_tab_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/support_chat_screen/support_chat_screen.dart';
import '../screens/welcome_screen/welcome_screen.dart';

class Routes {
  static const String splash = '/splash';
  static const String welcomeScreen = "/welcomeScreen";
  static const String loginScreen = "/loginScreen";
  static const String forgotScreen = "/forgotScreen";
  static const String signUpScreen = "/SignUpScreen";
  static const String bottomTabScreen = '/mainHomeScreen';
  static const String supportChatScreen = '/supportChatScreen';


  static final routes = {
    splash: (context) => const SplashScreen(),

    bottomTabScreen: (context) => const BottomTabScreen(),
    supportChatScreen: (context) => const SupportChatScreen(),
    welcomeScreen: (context) => const WelcomeScreen(),
    loginScreen: (context) => const LoginScreen(),
    forgotScreen: (context) => const ForgotPasswordScreen(),
    signUpScreen: (context) => const SignUpScreen(),
  };



}