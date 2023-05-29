import 'package:dartz/dartz.dart';
import '../entities/no_params.dart';
import 'usecase.dart';
import '../entities/app_error.dart';
import '../repositories/weather_repository.dart';

class GetFavoriteCities extends UseCase<List<String>, NoParams> {
  final WeatherRepository repository;

  GetFavoriteCities(this.repository);
  @override
  Future<Either<AppError, List<String>>> call(NoParams params) async {
    return await repository.getFavoriteCities();
  }
}
