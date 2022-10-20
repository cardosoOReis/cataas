import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../../dto/cat_dto.dart';
import '../get_cat_by_id_datasource.dart';

class DefaultGetCatByIdDatasourceImp implements GetCatByIdDatasource {
  @override
  Future<CatDto> call(String id) async {
    Uri baseUrl = Uri.parse('https://cataas.com/cat/$id?json=true');

    var response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return CatDto.fromJson(jsonResponse);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
