import 'package:fpdart/fpdart.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/cat.dart';
import '../../domain/entities/filters.dart';

abstract class IGetCatByIdUsecase
    extends Usecase<Cat, GetCatByIdUsecaseParams> {}

class GetCatByIdUsecaseParams {
  final String id;
  final Option<String> text;
  final Option<String> textColor;
  final Option<Filters> filter;
  const GetCatByIdUsecaseParams({
    required this.id,
    required this.text,
    required this.textColor,
    required this.filter,
  });
}
