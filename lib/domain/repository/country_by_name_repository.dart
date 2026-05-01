part of '../domain.dart';

abstract class CountryByNameRepository {
  Future<Either<Failure, List<CountryEntity>>> getCountryByName(String? name);
}