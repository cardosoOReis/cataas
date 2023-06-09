import 'package:fpdart/fpdart.dart';

import '../../error/failures.dart';

abstract class IOpenUrlOnBrowserService {
  Future<Either<Failure, void>> call(String url);
}
