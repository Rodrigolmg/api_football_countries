part of '../../data.dart';

abstract class CountryDataSource {
  Future<List<CountryModel>> getCountryByName(String? name);
}

class CountryDataSourceImpl implements CountryDataSource {

  final DioMethod dio;

  const CountryDataSourceImpl({
    required this.dio
  });

  @override
  Future<List<CountryModel>> getCountryByName(String? name) async {
    Response response = await dio.getMethod(UrlPath.byNamePath(name));

    if(response.statusCode != null &&
        (response.statusCode == 200 || response.statusCode == 204)){

      List<dynamic>? data = response.data['response'];

      if(data == null || data.isEmpty){
        throw ServerException(statusCode: 204);
      }

      List<CountryModel> countries = data.map(
          (e) => CountryModel.fromJson(e)
      ).toList();

      return Future.value(countries);
    } else {
      throw ServerException(statusCode: response.statusCode);
    }
  }


}