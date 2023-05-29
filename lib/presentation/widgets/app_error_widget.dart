import 'package:flutter/material.dart';
import '../../common/extensions/size_extensions.dart';
import '../../common/constants/size_constants.dart';
import '../../domain/entities/app_error.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function onPressed;

  const AppErrorWidget({
    Key? key,
    required this.errorType,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.contentNotFound
                ? 'City Not found'
                : 'Something went wrong',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () => onPressed(),
                child: Text('Retry'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
