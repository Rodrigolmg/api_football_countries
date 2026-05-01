part of '../domain.dart';

class GetCountryByNameUseCase implements UseCase<List<CountryEntity>, String?> {

  final CountryByNameRepository repository;

  GetCountryByNameUseCase({
    required this.repository
  });

  @override
  Future<Either<Failure, List<CountryEntity>>> call([String? name]) {
    return repository.getCountryByName(name);
  }
}