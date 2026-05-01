part of '../core.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {

  final InternetConnection internetConnection;

  const NetworkInfoImpl({
    required this.internetConnection
  });

  @override
  Future<bool> get isConnected => internetConnection.hasInternetAccess;
}