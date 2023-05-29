import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';

abstract class NotificationRepository {
  Future<Either<AppError, void>> sendNotification(Map<String, dynamic> params);
}
