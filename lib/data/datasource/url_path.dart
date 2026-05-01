part of '../data.dart';

class UrlPath {
  static String byNamePath(String? name) =>
      '/countries?name=$name';
}