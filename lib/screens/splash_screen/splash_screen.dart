import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/res.dart';
import 'package:packages_mall_employer/screens/splash_screen/splash_components.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _navigateToHome();
    super.initState();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (BuildContext context) => const SplashScreen()));

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initializeAppResources(context: context),
        builder: (__, _) {
          return Scaffold(body: SplashComponents.splashLayout());
        });
  }
}
