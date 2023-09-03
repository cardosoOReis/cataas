import 'package:fpdart/fpdart.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/cat.dart';
import '../../domain/entities/filters.dart';

abstract class IGetCatByTagUsecase
    extends Usecase<Cat, GetCatByTagUsecaseParams> {}

class GetCatByTagUsecaseParams {
  final String tag;
  final Option<String> text;
  final Option<String> textColor;
  final Option<Filters> filter;
  const GetCatByTagUsecaseParams({
    required this.tag,
    required this.text,
    required this.textColor,
    required this.filter,
  });
}
