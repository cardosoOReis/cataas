import 'package:cataas/core/network/i_network_info.dart';
import 'package:cataas/core/network/network_info_impl.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockInternetConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late INetworkInfo networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo =
        NetworkInfoImpl(connectionChecker: mockInternetConnectionChecker);
  });

  group('When [isConnected] is called,', () {
    test('should forward the call to connectionChecker.hasConnection',
        () async {
      // Arrange
      final tHasConnectionFuture = Future.value(true);
      when((() => mockInternetConnectionChecker.hasConnection))
          .thenAnswer((_) => tHasConnectionFuture);

      // Act
      final result = networkInfo.isConnected;

      // Assert
      verify(() => mockInternetConnectionChecker.hasConnection).called(1);
      expect(result, tHasConnectionFuture);
    });
  });
}
