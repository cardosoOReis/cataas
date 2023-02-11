import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/cat_entity.dart';

abstract class IGetCatByTagUsecase
    extends Usecase<CatEntity, GetCatByTagUsecaseParams> {}

class GetCatByTagUsecaseParams {
  final String tag;
  final Option<String> text;
  final Option<String> textColor;
  final Option<String> filter;
  const GetCatByTagUsecaseParams({
    required this.tag,
    required this.text,
    required this.textColor,
    required this.filter,
  });
}
