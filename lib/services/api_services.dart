import 'package:http/http.dart' as http;
import 'package:logindemo/services/constant.dart';

class ApiServices {
  getRequest(String url) async {
    try {
      var endpoint = Uri.parse(BASE_URL + url);
      var response = await http.get(endpoint);
      if (response.statusCode == 200) {
        return response.body;
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

  Future<String> postRequest(String url, Map<String, dynamic> body) async {
    try {
      var endpoint = Uri.parse(BASE_URL + url);

      var response = await http.post(endpoint, body: body);
      print(response.body);

      if (response.statusCode == 200) {
        print(response.body);

        return response.body;
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
