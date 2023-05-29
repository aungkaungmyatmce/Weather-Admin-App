import 'package:flutter/material.dart';
import 'package:weather_admin_app_with_clean_architecture/presentation/journeys/notification/notification_screen.dart';
import '../common/constants/route_constants.dart';
import 'journeys/detail/weather_detail_argument.dart';
import 'journeys/detail/weather_detail_screen.dart';
import 'journeys/favorite/favorite_screen.dart';
import 'journeys/home/home_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.initial: (context) => HomeScreen(),
        RouteList.home: (context) => HomeScreen(),
        RouteList.detail: (context) => WeatherDetailScreen(
              weatherDetailArguments:
                  setting.arguments as WeatherDetailArguments,
            ),
        RouteList.noti: (context) => NotificationScreen(),
        RouteList.favorite: (context) => FavoriteScreen(),
      };
}
