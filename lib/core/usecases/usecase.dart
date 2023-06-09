import 'package:fpdart/fpdart.dart';

import '../error/failures.dart';

abstract class Usecase<ReturnType, Params> {
  Future<Either<Failure, ReturnType>> call(Params params);
}
