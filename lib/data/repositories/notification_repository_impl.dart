import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:weather_admin_app_with_clean_architecture/data/data_sources/cloud_messaging_remote_datasource.dart';

import 'package:weather_admin_app_with_clean_architecture/domain/entities/app_error.dart';

import '../../domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final CloudMessagingRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, void>> sendNotification(
      Map<String, dynamic> params) async {
    try {
      final response = await remoteDataSource.sendMessage(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
