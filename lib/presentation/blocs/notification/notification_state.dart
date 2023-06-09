part of 'notification_cubit.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
}

class NotificationInitial extends NotificationState {
  @override
  List<Object> get props => [];
}

class NotificationSentState extends NotificationState {
  @override
  List<Object?> get props => [];
}

class NotificationSentErrorState extends NotificationState {
  @override
  List<Object?> get props => [];
}
