part of '../../data.dart';

abstract class CountryDataSource {
  Future<List<CountryModel>?> getCountryByName(String? name);
}