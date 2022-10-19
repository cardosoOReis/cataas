import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../get_tags_datasource.dart';

class DefaultGetTagsDatasourceImp implements GetTagsDatasource {
  @override
  Future<List<String>> call() async {
    Uri baseUrl = Uri.parse('https://cataas.com/api/tags');
    var response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      List<String> jsonResponse =
          convert.jsonDecode(response.body).cast<String>();
      // print(jsonResponse);
      return jsonResponse;
    } else {
      throw Exception('Request failed with status ${response.statusCode}');
    }
  }
}
