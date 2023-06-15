import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newpro/models/data_loger_item.dart';

class Api {
  static const String baseUrl =
      'http://cash.pythonanywhere.com/user/logger/data';
  static const Map<String, String> headers = {
    'Cookie':
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImRlbm55IiwiZXhwIjoxNjg5MzQ3Mzg2fQ.8r6ZY8dRVD6-9C9mxXToeCPkC-Fgq6lO7BhEf1KPNuM.eyJ1c2VybmFtZSI6ImRlbm55IiwiZXhwIjoxNjg2MzU3MzI1fQ.EuEL1JltNcPyD7AR8FpMxQKEgAy43CdHNOS8ezLYWRY',
    'Data-logger-name': 'denny_data_logger_1',
    'Accept': ' */*'
  };

  static Future<List<Dataloger>> fetchDataLogerInfo() async {
    final response = await http.post(Uri.parse(baseUrl), headers: headers);
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      final List<Dataloger> dataloger =
          jsonList.map((json) => Dataloger.fromJson(json)).toList();
      return dataloger;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
