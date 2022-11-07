import 'package:country/model/country_model.dart';
import 'package:country/screen/widget/home_country_widget.dart';
import 'package:country/utils/color.dart';
import 'package:country/utils/text.dart';
import 'package:flutter/material.dart';

class CountrySearchDelegate extends SearchDelegate {
  final List<CountryModel>? searchCountry;
  CountrySearchDelegate(this.searchCountry);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  TextInputAction get textInputAction => TextInputAction.search;

  @override
  String? get searchFieldLabel => 'Search Country';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors().primary,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors().primary,
        elevation: .0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColors().secondary),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<CountryModel> matchQuery = [];
    for (var country in searchCountry!) {
      if (country.name!.official!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(country);
      }
    }
    if (matchQuery.isEmpty) {
      return Center(
        child: Text(
          AppTexts().detail,
          style: TextStyle(
            color: AppColors().secondary,
            fontSize: 18,
          ),
        ),
      );
    }
    return HomeCountryWidget(context).displayCountry(matchQuery);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<CountryModel> matchQuery = [];
    for (var country in searchCountry!) {
      if (country.name!.official!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(country);
      }
    }
    if (matchQuery.isEmpty) {
      return Center(
        child: Text(
          'no data',
          style: TextStyle(
            color: AppColors().secondary,
            fontSize: 18,
          ),
        ),
      );
    }
    return HomeCountryWidget(context).displayCountry(matchQuery);
  }
}
