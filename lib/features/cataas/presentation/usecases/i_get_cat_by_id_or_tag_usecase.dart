import 'package:fpdart/fpdart.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/cat.dart';

abstract class IGetCatByIdOrTagUsecase
    extends Usecase<Cat, GetCatByIdOrTagUsecaseParams> {}

class GetCatByIdOrTagUsecaseParams {
  final String value;
  final Option<String> text;
  final Option<String> textColor;
  final Option<String> filter;
  const GetCatByIdOrTagUsecaseParams({
    required this.value,
    required this.text,
    required this.textColor,
    required this.filter,
  });
}
