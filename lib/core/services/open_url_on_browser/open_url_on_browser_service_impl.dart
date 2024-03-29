import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../error/failures.dart';
import 'i_open_url_on_browser_service.dart';

class OpenUrlOnBrowserServiceImpl implements IOpenUrlOnBrowserService {
  const OpenUrlOnBrowserServiceImpl();

  @override
  Future<Either<Failure, void>> call(String url) async {
    try {
      final result = await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );

      if (!result) {
        return const Left(CouldntOpenUrlOnBrowserFailure());
      }

      return const Right(null);
    } on PlatformException {
      return const Left(CouldntOpenUrlOnBrowserFailure());
    }
  }
}
