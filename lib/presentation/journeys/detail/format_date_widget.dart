import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormatDateWidget extends StatelessWidget {
  final String dateTimeString;
  final String formatPattern;
  final TextStyle textStyle;
  const FormatDateWidget(
      {Key? key,
      required this.dateTimeString,
      required this.formatPattern,
      required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat formatter = DateFormat(formatPattern);
    String formattedDate = formatter.format(dateTime);
    return Text(
      formattedDate,
      textAlign: TextAlign.center,
      style: textStyle,
    );
  }
}
