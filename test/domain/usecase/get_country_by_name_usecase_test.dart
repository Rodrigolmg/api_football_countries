import 'package:api_football_countries/core/core.dart';
import 'package:api_football_countries/domain/domain.dart';
import 'package:api_football_countries/domain/entity/country_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<CountryByNameRepository>()])
import 'get_country_by_name_usecase_test.mocks.dart';

void main() {

  late GetCountryByNameUseCase useCase;
  late MockCountryByNameRepository mockRepository;

  setUp(() {
    mockRepository = MockCountryByNameRepository();
    useCase = GetCountryByNameUseCase(repository: mockRepository);
  });

  List<CountryEntity> countries = [CountryEntity(
    name: 'name'
  )];

  provideDummy<Either<Failure, List<CountryEntity>>>(Right(countries));

  test('Should get Right value', () async {

    when(mockRepository.getCountryByName(any))
        .thenAnswer((_) async => Right(countries));

    final result = await useCase('countryName');
    
    expect(result, Right(countries));
  });
}