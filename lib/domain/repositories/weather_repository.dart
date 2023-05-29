import 'package:dartz/dartz.dart';
import '../entities/app_error.dart';
import '../entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<AppError, WeatherEntity>> getCurrentWeather(
      Map<String, dynamic> params);
  Future<Either<AppError, WeatherEntity>> getForecastWeather(
      Map<String, dynamic> params);

  Future<Either<AppError, void>> saveCity(String cityName);
  Future<Either<AppError, List<String>>> getFavoriteCities();
  Future<Either<AppError, void>> deleteFavoriteCity(String cityName);
  Future<Either<AppError, bool>> checkIfCityFavorite(String cityName);
}
