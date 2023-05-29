import '../core/network/api_client.dart';
import '../models/WeatherModel.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(Map<String, dynamic> requestBody);
  Future<WeatherModel> getForecastWeather(Map<String, dynamic> requestBody);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final ApiClient _client;

  WeatherRemoteDataSourceImpl(this._client);
  @override
  Future<WeatherModel> getCurrentWeather(
      Map<String, dynamic> requestBody) async {
    final response = await _client.get('current.json', params: requestBody);
    final weather = WeatherModel.fromJson(response);
    return weather;
  }

  @override
  Future<WeatherModel> getForecastWeather(
      Map<String, dynamic> requestBody) async {
    final response = await _client.get('forecast.json', params: requestBody);
    final weather = WeatherModel.fromJson(response);
    return weather;
  }
}
