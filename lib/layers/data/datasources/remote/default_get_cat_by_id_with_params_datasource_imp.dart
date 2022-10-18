import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../../../domain/entities/cat_entity.dart';
import '../../dto/cat_dto.dart';
import '../get_cat_by_id_with_params_datasource.dart';

class DefaultGetCatByIdWithParamsDatasourceImp
    implements GetCatByIdWithParamsDatasource {
  @override
  Future<CatEntity> call({
    required String id,
    String? text,
    String? textColor,
    String? filter,
  }) async {
    String urlBuilder = 'https://cataas.com/cat/$id';

    if (text != null) {
      urlBuilder += '/says/$text';
    }
    urlBuilder += '?json=true';
    if (textColor != null) {
      urlBuilder += '&color=$textColor';
    }
    if (filter != null) {
      urlBuilder += '&filter=$filter';
    }
    // print(urlBuilder);
    Uri baseUrl = Uri.parse(urlBuilder);
    var response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse['text'] = text;
      jsonResponse['textColor'] = textColor;
      jsonResponse['filter'] = filter;
      // print(jsonResponse);
      return CatDto.fromJson(jsonResponse);
    } else {
      throw Exception('Request failed with status ${response.statusCode}');
    }
  }
}
