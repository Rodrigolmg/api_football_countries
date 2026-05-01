part of '../data.dart';

class CountryByNameRepositoryImpl implements CountryByNameRepository {

  final CountryDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const CountryByNameRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, List<CountryEntity>>> getCountryByName(String? name) async {

    if(await networkInfo.isConnected) {
      try {
        List<CountryModel> countries =
          await remoteDataSource.getCountryByName(name);
        return Right(countries);
      } on ServerException catch (sE) {
        return Left(ServerFailure(statusCode: sE.statusCode));
      }

    } else {
      return Left(ServerFailure());
    }

  }

}