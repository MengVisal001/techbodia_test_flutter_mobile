import 'dart:convert';

import 'package:country/model/country_model.dart';
import 'package:http/http.dart' as http;

class CountryRepo {
  static const String _baseUrl = 'https://restcountries.com/v3.1/all';
  Future<List<CountryModel>?> getAllCountry() async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        return CountryModel.fromList(jsonDecode(response.body));
      }
      return null;
    } finally {
      client.close();
    }
  }
}
