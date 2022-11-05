import 'package:flutter/material.dart';

import 'screen/home_country_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeCountry(),
    );
  }
}
