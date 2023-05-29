import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/notification_param.dart';
import '../../../domain/usecases/send_notification.dart';
import '../loading/loading_cubit.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final SendNotification sendNotification;
  final LoadingCubit loadingCubit;
  NotificationCubit({
    required this.sendNotification,
    required this.loadingCubit,
  }) : super(NotificationInitial());

  void sendNoti({required String title, required String body}) async {
    loadingCubit.show();
    final eitherResponse = await sendNotification(NotificationParam(
      title: title,
      body: body,
    ));

    emit(eitherResponse.fold(
        (l) => NotificationSentErrorState(), (r) => NotificationSentState()));
    loadingCubit.hide();
  }

  void showInitial() {
    emit(NotificationInitial());
  }
}
