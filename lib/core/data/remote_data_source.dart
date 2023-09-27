import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteDataSource {
  Future<dynamic> getData(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode >= 400) {
        throw Exception();
      }
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } catch (err) {
      rethrow;
    }
  }

  Future<dynamic> postData(String url, dynamic data) async {
    http.Response response = await http.post(Uri.parse(url), body: data);
    var jsonResponse = jsonDecode(response.body);
    return jsonResponse;
  }
}
