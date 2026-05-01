part of '../data.dart';

class CountryModel extends CountryEntity {

  CountryModel({
    super.name,
    super.code,
    super.flag
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {

    CountryModel countryModel = CountryModel(
      name: json['name'],
      code: json['code'],
      flag: json['flag']
    );

    return countryModel;
  }

}