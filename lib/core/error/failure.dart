part of '../core.dart';

abstract class Failure extends Equatable {
  final List<dynamic>? properties;

  const Failure({
    this.properties
  });
}