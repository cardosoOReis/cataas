// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:cataas/core/network/i_network_info.dart';

class NetworkInfoImpl implements INetworkInfo {
  final InternetConnectionChecker connectionChecker;
  NetworkInfoImpl({
    required this.connectionChecker,
  });

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
