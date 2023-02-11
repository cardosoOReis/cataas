import 'package:dartz/dartz.dart';
import 'package:url_launcher/url_launcher.dart';

import '../error/failures.dart';
import 'i_open_url_on_browser_service.dart';

class OpenUrlOnBrowserService implements IOpenUrlOnBrowserService {
  @override
  Future<Either<Failure, void>> call(String url) async {
    final result = await launchUrl(Uri.parse(url));

    return result
        ? const Right(null)
        : const Left(CouldntOpenUrlOnBrowserFailure());
  }
}
