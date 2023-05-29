import 'dart:convert';
import 'package:http/http.dart';
import 'api_constants.dart';
import 'error/exception.dart';

///https://api.weatherapi.com/v1/forecast.json?key=dc2f0209b33642cbb72154206232505&q=London&days=3&aqi=no&alerts=no

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.get(
      Uri.parse(getPath(path, params)),
      headers: {'Content-Type': 'application/json'},
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      throw ContentNotFoundException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic postNotiSever({Map<dynamic, dynamic>? params}) async {
    final response = await _client.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      body: jsonEncode(params),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': ApiConstants.MESSAGING_KEY
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnAuthorisedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  String getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';

    if (params?.isNotEmpty ?? false) {
      params!.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }
    return '${ApiConstants.BASE_URL}$path?key=${ApiConstants.API_KEY}$paramsString';
  }
}
