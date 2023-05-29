import 'package:equatable/equatable.dart';

class NotificationParam extends Equatable {
  final String body;
  final String title;

  NotificationParam({required this.body, required this.title});

  Map<String, dynamic> toJson() => {
        "to": "/topics/weather",
        "notification": {"body": body, "title": title}
      };

  @override
  // TODO: implement props
  List<Object?> get props => [body, title];
}
