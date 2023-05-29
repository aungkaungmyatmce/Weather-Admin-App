import 'package:dartz/dartz.dart';
import 'package:weather_admin_app_with_clean_architecture/domain/entities/app_error.dart';
import 'package:weather_admin_app_with_clean_architecture/domain/repositories/notification_repository.dart';
import 'package:weather_admin_app_with_clean_architecture/domain/usecases/usecase.dart';

import '../entities/notification_param.dart';

class SendNotification extends UseCase<void, NotificationParam> {
  final NotificationRepository repository;

  SendNotification(this.repository);
  @override
  Future<Either<AppError, void>> call(NotificationParam params) async {
    return await repository.sendNotification(params.toJson());
  }
}
