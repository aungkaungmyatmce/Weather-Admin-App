import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_admin_app_with_clean_architecture/di/get_it.dart';
import 'package:weather_admin_app_with_clean_architecture/presentation/blocs/notification/notification_cubit.dart';
import 'package:weather_admin_app_with_clean_architecture/presentation/journeys/notification/notification_form_widget.dart';

import '../drawer/navigation_drawer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationCubit notificationBloc;

  @override
  void initState() {
    notificationBloc = getItInstance<NotificationCubit>();
    super.initState();
  }

  @override
  void dispose() {
    notificationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationCubit>.value(
      value: notificationBloc,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Send Notifications to users',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          body: BlocConsumer<NotificationCubit, NotificationState>(
            builder: (context, state) {
              if (state is NotificationInitial) {
                return NotificationFormWidget();
              }
              return Container();
            },
            listener: (context, state) {
              if (state is NotificationSentState) {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text('Weather Data'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Notification Successfully Sent!',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          BlocProvider.of<NotificationCubit>(context)
                              .showInitial();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}
