import 'package:cataas/core/services/open_url_on_browser/i_open_url_on_browser_service.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/app_bar_icon_atom/app_bar_tweeter_icon_atom.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late AppBarTweeterIconAtom atom;
  late IOpenUrlOnBrowserService mockService;
  setUp(() {
    mockService = MockOpenUrlOnBrowser();
    atom = AppBarTweeterIconAtom(service: mockService);
  });

  group('When [onTap] is called,', () {
    test('should try to open the url on the browser', () async {
      //Arrange
      when(() => mockService(any())).thenAnswer((_) async => const Right(null));

      //Act
      atom.onIconTap();

      //Assert
      verify(() => mockService(any())).called(1);
    });
  });
}
