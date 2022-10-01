import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logindemo/services/constant.dart';

class ApiServices {
  Future get(String url) async {
    http.Response response;
    try {
      var endPoint = Uri.parse(BASE_URL + url);

      response = await http.get(
        endPoint,
      );
      if (response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 401) {
        throw http.ClientException(" Unauthorized");
      } else if (response.statusCode == 500) {
        throw http.ClientException("Bad request");
      } else {
        throw Exception("Something went wrong");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future post(String url, Map<String, dynamic> body) async {
    try {
      var endpoint = Uri.parse(BASE_URL + url);
      print(body.toString());
      var response = await http.post(
        endpoint,
        body: body,
      );

      print(response.body);

      if (response.statusCode == 200) {
        print(response.body);
        var result = jsonDecode(response.body);
        return result;
      } else if (response.statusCode == 401) {
        throw http.ClientException(" Unauthorized");
      } else if (response.statusCode == 500) {
        throw http.ClientException("Bad request");
      } else {
        throw Exception("Something went wrong");
      }
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
