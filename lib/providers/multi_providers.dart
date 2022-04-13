
import 'package:packages_mall_employer/screens/auth_screens/forgot_pasword_screen/forgot_password_provider.dart';
import 'package:packages_mall_employer/screens/auth_screens/login_screen/login_provider.dart';
import 'package:packages_mall_employer/screens/auth_screens/signup_screen/sign_up_provider.dart';
import 'package:provider/provider.dart';

final multiProviders = [
  ChangeNotifierProvider<SignUpProvider>(
    create: (_) => SignUpProvider(),
    lazy: true,
  ), ChangeNotifierProvider<LoginProvider>(
    create: (_) => LoginProvider(),
    lazy: true,
  ), ChangeNotifierProvider<ForgotPasswordProvider>(
    create: (_) => ForgotPasswordProvider(),
    lazy: true,
  ),
];
