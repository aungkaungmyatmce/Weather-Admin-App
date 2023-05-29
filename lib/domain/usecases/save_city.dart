import 'package:dartz/dartz.dart';
import 'usecase.dart';
import '../entities/app_error.dart';
import '../entities/city_params.dart';
import '../repositories/weather_repository.dart';

class SaveCity extends UseCase<void, CityParams> {
  final WeatherRepository repository;
  SaveCity(this.repository);
  @override
  Future<Either<AppError, void>> call(CityParams params) async {
    return await repository.saveCity(params.cityName);
  }
}
