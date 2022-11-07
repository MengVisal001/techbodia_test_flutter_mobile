import 'package:country/controller/country_controller.dart';
import 'package:country/model/country_model.dart';
import 'package:country/screen/widget/home_country_widget.dart';
import 'package:flutter/material.dart';

class HomeCountry extends StatefulWidget {
  const HomeCountry({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeCountryState createState() => _HomeCountryState();
}

class _HomeCountryState extends State<HomeCountry>
    with TickerProviderStateMixin {
  final CountryController controller = CountryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: HomeCountryWidget.title(),
        actions:
            HomeCountryWidget(context).buttonActionIcon(controller.listCountry),
      ),
      body: FutureBuilder<List<CountryModel>?>(
        future: controller.getAllCountry(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return HomeCountryWidget.linearProgressIndicator();
          }
          return HomeCountryWidget(context).displayCountry(snapshot.data!);
        },
      ),
    );
  }
}
