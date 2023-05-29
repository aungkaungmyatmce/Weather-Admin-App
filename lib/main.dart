import 'package:flutter/material.dart';
import 'data/core/utils/cloud_messaging_utils.dart';
import 'presentation/weather_app.dart';
import 'di/get_it.dart' as getIt;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await getIt.init();
  CloudMessaging().messagingSetUp();
  runApp(WeatherApp());
}
