part of '../core.dart';

class ServerException implements Exception {
  int? statusCode;

  ServerException({
    this.statusCode,
  });
}


class CacheException implements Exception {}