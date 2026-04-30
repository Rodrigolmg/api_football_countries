part of '../domain.dart';

class GetCountryByNameUseCase implements UseCase<CountryEntity, String?> {

  final CountryByNameRepository repository;

  GetCountryByNameUseCase({
    required this.repository
  });

  @override
  Future<Either<Failure, CountryEntity>> call([String? name]) {
    return repository.getCountryByName(name);
  }
}