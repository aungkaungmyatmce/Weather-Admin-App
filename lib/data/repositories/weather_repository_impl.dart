import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../domain/entities/app_error.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/repositories/weather_repository.dart';
import '../core/network/error/exception.dart';
import '../data_sources/weather_local_data_source.dart';
import '../data_sources/weather_remote_data_source.dart';
import '../models/WeatherModel.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;

  WeatherRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<AppError, WeatherModel>> getCurrentWeather(
      Map<String, dynamic> params) async {
    try {
      final weather = await remoteDataSource.getCurrentWeather(params);
      return Right(weather);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, WeatherEntity>> getForecastWeather(
      Map<String, dynamic> params) async {
    try {
      final weather = await remoteDataSource.getForecastWeather(params);
      return Right(weather);
    } on ContentNotFoundException {
      return Left(AppError(AppErrorType.contentNotFound));
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> checkIfCityFavorite(String cityName) async {
    try {
      final response = await localDataSource.checkIfCityFavourite(cityName);
      return Right(response);
    } on Exception {
      return left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> deleteFavoriteCity(String cityName) async {
    try {
      final response = await localDataSource.deleteCity(cityName);
      return Right(response);
    } on Exception {
      return left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<String>>> getFavoriteCities() async {
    try {
      final response = await localDataSource.getCities();
      return Right(response);
    } on Exception {
      return left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> saveCity(String cityName) async {
    try {
      final response = await localDataSource.saveCity(cityName);
      return Right(response);
    } on Exception {
      return left(AppError(AppErrorType.database));
    }
  }
}
