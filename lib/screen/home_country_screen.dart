import 'package:country/utils/icon.dart';
import 'package:country/utils/text.dart';
import 'package:flutter/material.dart';

class HomeCountry extends StatefulWidget {
  const HomeCountry({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeCountryState createState() => _HomeCountryState();
}

class _HomeCountryState extends State<HomeCountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts().titleApp),
        actions: <IconButton>[
          IconButton(
            icon: AppIcons().search,
            onPressed: () {},
          ),
          IconButton(
            icon: AppIcons().moreVert,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
