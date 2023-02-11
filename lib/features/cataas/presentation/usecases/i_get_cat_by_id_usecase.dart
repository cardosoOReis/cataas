import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/cat_entity.dart';

abstract class IGetCatByIdUsecase
    extends Usecase<CatEntity, GetCatByIdUsecaseParams> {}

class GetCatByIdUsecaseParams {
  final String id;
  final Option<String> text;
  final Option<String> textColor;
  final Option<String> filter;
  const GetCatByIdUsecaseParams({
    required this.id,
    required this.text,
    required this.textColor,
    required this.filter,
  });
}
