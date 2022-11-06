import 'package:country/utils/color.dart';
import 'package:flutter/material.dart';

import 'screen/home_country_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeCountry(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors().primary,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors().primary,
          elevation: .5,
        ),
      ),
    );
  }
}
