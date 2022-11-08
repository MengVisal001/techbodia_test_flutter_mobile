import 'dart:async';

import 'package:country/model/country_model.dart';
import 'package:country/repo/country_repo.dart';

class CountryController {
  final _countryRepo = CountryRepo();
  List<CountryModel> listCountry = <CountryModel>[];
  late int currentPage;
  late bool isLoading;

  Future<List<CountryModel>?> getAllCountry() async {
    listCountry.clear();
    final response = await _countryRepo.getAllCountry();
    if (response != null) {
      listCountry.addAll(response);
      return listCountry;
    }
    return null;
  }
}
