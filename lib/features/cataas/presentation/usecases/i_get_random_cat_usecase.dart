import 'package:fpdart/fpdart.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/cat.dart';
import '../../domain/entities/filters.dart';

abstract class IGetRandomCatUsecase
    extends Usecase<Cat, GetRandomCatUsecaseParams> {}

class GetRandomCatUsecaseParams {
  final Option<String> text;
  final Option<String> textColor;
  final Option<Filters> filter;
  const GetRandomCatUsecaseParams({
    required this.text,
    required this.textColor,
    required this.filter,
  });
}
