
import 'package:packages_mall_employer/screens/auth_screens/forgot_pasword_screen/forgot_password_screen.dart';
import 'package:packages_mall_employer/screens/auth_screens/login_screen/login_screen.dart';
import 'package:packages_mall_employer/screens/splash_screen/splash_screen.dart';
import 'package:packages_mall_employer/screens/welcome_screen/welcome_screen.dart';

class Routes {
  static const String splash = '/splash';
  static const String welcomeScreen = "/welcomeScreen";
  static const String loginScreen = "/loginScreen";
  static const String forgotScreen = "/forgotScreen";


  static final routes = {
    splash: (context) => const SplashScreen(),
    welcomeScreen: (context) => const WelcomeScreen(),
    loginScreen: (context) => const LoginScreen(),
    forgotScreen: (context) => const ForgotPasswordScreen(),
  };




  //
}