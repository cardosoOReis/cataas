import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shell/layers/data/datasources/get_cat_amount_datasource.dart';

class DefaultGetCatAmountDatasourceImp implements GetCatAmountDatasource {
  
  @override
  Future<int> call() async {
    Uri baseUrl = Uri.parse('https://cataas.com/api/count');
    var response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse['number'];
    } else {
      throw Exception('Request failed with status ${response.statusCode}');
    }
  }
  
}