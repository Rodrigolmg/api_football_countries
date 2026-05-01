import 'dart:convert';

import 'package:api_football_countries/data/data.dart';
import 'package:api_football_countries/domain/entity/country_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';
import '../../fixtures/json_file_name.dart';

void main() {

  CountryModel countryModel = CountryModel();
  CountryEntity countryEntity = CountryModel(
    name: 'n',
    flag: 'f',
    code: 'c'
  );

  test('Should be a subclass of CountryEntity', () {
    expect(countryModel, isA<CountryEntity>());
  });

  test('Should contain value in the countryEntity fields', () {
    expect(countryEntity.flag, isNotNull);
    expect(countryEntity.code, isNotNull);
    expect(countryEntity.name, isNotNull);
  });

  group('fromJson', () {
    test('Should return a CountryModel object from json', () {
      final Map<String, dynamic> json = jsonDecode(readFixture(countryJson));
      final result = CountryModel.fromJson(json);
      expect(result, isA<CountryModel>());
    });

    test('Should contain value in the fields', () {
      final Map<String, dynamic> json = jsonDecode(readFixture(countryJson));
      final result = CountryModel.fromJson(json);
      expect(result.name, isNotNull);
      expect(result.flag, isNotNull);
      expect(result.code, isNotNull);
    });

    test('Should contain GB in code field', () {
      final Map<String, dynamic> json = jsonDecode(readFixture(countryJson));
      final result = CountryModel.fromJson(json);
      expect(result.code, equals('GB'));
    });

  });
}