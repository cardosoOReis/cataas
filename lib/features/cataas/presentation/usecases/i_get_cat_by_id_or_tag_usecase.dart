import 'package:fpdart/fpdart.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/cat.dart';
import '../../domain/entities/filters.dart';

abstract class IGetCatByIdOrTagUsecase
    extends Usecase<Cat, GetCatByIdOrTagUsecaseParams> {}

class GetCatByIdOrTagUsecaseParams {
  final String value;
  final Option<String> text;
  final Option<String> textColor;
  final Option<Filters> filter;
  const GetCatByIdOrTagUsecaseParams({
    required this.value,
    required this.text,
    required this.textColor,
    required this.filter,
  });
}
