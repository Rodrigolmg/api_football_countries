part of '../data.dart';

class CountryByNameRepositoryImpl implements CountryByNameRepository {

  final CountryDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const CountryByNameRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, List<CountryEntity>>> getCountryByName(String? name) {
    // TODO: implement getCountryByName
    throw UnimplementedError();
  }

}