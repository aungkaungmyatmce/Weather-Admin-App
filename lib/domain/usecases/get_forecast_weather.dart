import 'package:dartz/dartz.dart';
import '../entities/forecast_weather_params.dart';
import '../entities/weather_entity.dart';
import 'usecase.dart';
import '../entities/app_error.dart';
import '../repositories/weather_repository.dart';

class GetForecastWeather extends UseCase<WeatherEntity, ForecastWeatherParams> {
  final WeatherRepository weatherRepository;

  GetForecastWeather(this.weatherRepository);

  @override
  Future<Either<AppError, WeatherEntity>> call(
      ForecastWeatherParams params) async {
    return await weatherRepository.getForecastWeather(params.toJson());
  }
}
