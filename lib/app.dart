import 'package:country/navigation/route_name.dart';
import 'package:country/navigation/router.dart';
import 'package:country/utils/color.dart';
import 'package:flutter/material.dart';

import 'screen/home_country_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName().homeCountry,
      routes: MyRouter().routes(),
      home: const HomeCountry(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors().primary,
        appBarTheme: AppBarTheme(
          color: AppColors().primary,
          elevation: .0,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors().buttonColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: AppColors().secondary,
            backgroundColor: null,
            textStyle: TextStyle(color: AppColors().secondary),
          ),
        ),
      ),
    );
  }
}
