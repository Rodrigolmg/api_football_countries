part of '../domain.dart';

abstract class CountryByNameRepository {
  Future<Either<Failure, CountryEntity>> getCountryByName(String? name);
}