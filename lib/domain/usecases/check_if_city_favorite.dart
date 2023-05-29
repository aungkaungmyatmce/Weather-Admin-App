import 'package:dartz/dartz.dart';
import '../entities/app_error.dart';
import 'usecase.dart';
import '../entities/city_params.dart';
import '../repositories/weather_repository.dart';

class CheckIfCityFavorite extends UseCase<bool, CityParams> {
  final WeatherRepository repository;

  CheckIfCityFavorite(this.repository);
  @override
  Future<Either<AppError, bool>> call(CityParams params) async {
    return await repository.checkIfCityFavorite(params.cityName);
  }
}
