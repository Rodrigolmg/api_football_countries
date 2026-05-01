library;

import 'package:api_football_countries/core/core.dart';
import 'package:api_football_countries/domain/domain.dart';
import 'package:api_football_countries/domain/entity/country_entity.dart';
import 'package:api_football_http/api_football_http.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';

part 'model/country_model.dart';
part 'repository/country_by_name_rapository_impl.dart';
part 'datasource/remote/country_datasource.dart';
part 'datasource/url_path.dart';