import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/cat.dart';

abstract class IGetRandomCatUsecase
    extends Usecase<Cat, GetRandomCatUsecaseParams> {}

class GetRandomCatUsecaseParams {
  final Option<String> text;
  final Option<String> textColor;
  final Option<String> filter;
  const GetRandomCatUsecaseParams({
    required this.text,
    required this.textColor,
    required this.filter,
  });
}
