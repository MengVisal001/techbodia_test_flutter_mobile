import 'package:country/navigation/route_name.dart';
import 'package:country/screen/home_country_screen.dart';
import 'package:flutter/material.dart';

class MyRouter extends RouteName {
  Map<String, Widget Function(BuildContext)> routes() => {
        homeCountry: (context) => const HomeCountry(),
      };
}
