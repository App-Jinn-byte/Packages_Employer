import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Packages Mall Employers App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.blue),
          )
      ),
      initialRoute: Routes.splash,
      routes: Routes.routes,
    );
  }
}


