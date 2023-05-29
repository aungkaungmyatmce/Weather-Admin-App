import 'package:dartz/dartz.dart';
import '../entities/weather_entity.dart';
import 'usecase.dart';
import '../entities/app_error.dart';
import '../repositories/weather_repository.dart';
import '../entities/current_weather_params.dart';

class GetCurrentWeather extends UseCase<WeatherEntity, CurrentWeatherParams> {
  final WeatherRepository weatherRepository;

  GetCurrentWeather(this.weatherRepository);
  @override
  Future<Either<AppError, WeatherEntity>> call(
      CurrentWeatherParams params) async {
    return await weatherRepository.getCurrentWeather(params.toJson());
  }
}
