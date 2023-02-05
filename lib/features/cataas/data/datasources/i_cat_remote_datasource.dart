import '../models/cat_model.dart';
import 'package:dartz/dartz.dart';

abstract class ICatRemoteDatasource {
  Future<CatModel> getRandomCat({
    required Option<String> text,
    required Option<String> textColor,
    required Option<String> filter,
  });
  Future<CatModel> getCatById({
    required String id,
    required Option<String> text,
    required Option<String> textColor,
    required Option<String> filter,
  });
  Future<CatModel> getCatByTag({
    required String tag,
    required Option<String> text,
    required Option<String> textColor,
    required Option<String> filter,
  });
}
