import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'i_network_info.dart';

class NetworkInfoImpl implements INetworkInfo {
  final InternetConnectionChecker connectionChecker;
  const NetworkInfoImpl({
    required this.connectionChecker,
  });

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
