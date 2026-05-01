import 'package:api_football_countries/core/core.dart';
import 'package:api_football_countries/data/data.dart';
import 'package:api_football_countries/domain/entity/country_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<CountryDataSource>(),
  MockSpec<NetworkInfo>(),
])
import 'country_by_name_repository_impl_test.mocks.dart';


void main() {

  late CountryByNameRepositoryImpl repositoryImpl;
  late MockCountryDataSource mockDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp((){
    mockDataSource = MockCountryDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = CountryByNameRepositoryImpl(
      remoteDataSource: mockDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  final name = 'England';
  final List<CountryModel> countries = [
    CountryModel(),
  ];
  
  test('Should check if device has connection', () {
    when(mockNetworkInfo.isConnected)
        .thenAnswer((_) async => true);

    repositoryImpl.getCountryByName(name);
    verify(mockNetworkInfo.isConnected);
  });

  group('Device is online', () {
    setUp((){
      when(mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
    });

    test('Should return remote data when the remote call is successfull', () async {

      when(mockDataSource.getCountryByName(any))
          .thenAnswer((_) async => countries);

      final result = await repositoryImpl.getCountryByName(name);

      expect(result, isNotNull);

    });
  });
}