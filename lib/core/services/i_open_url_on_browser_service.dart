import 'package:cataas/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class IOpenUrlOnBrowserService {
  Future<Either<Failure, void>> openUrl(String url);
}
