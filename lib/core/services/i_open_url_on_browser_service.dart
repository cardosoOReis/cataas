import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class IOpenUrlOnBrowserService {
  Future<Either<Failure, void>> call(String url);
}
