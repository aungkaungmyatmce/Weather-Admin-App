import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  WeatherEntity({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherEntity.fromJson(dynamic json) {
    return WeatherEntity(
      location: json['location'] != null
          ? LocationEntity.fromJson(json['location'])
          : null,
      current: json['current'] != null
          ? CurrentEntity.fromJson(json['current'])
          : null,
      forecast: json['forecast'] != null
          ? ForecastEntity.fromJson(json['forecast'])
          : null,
    );
  }
  final LocationEntity? location;
  final CurrentEntity? current;
  final ForecastEntity? forecast;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (current != null) {
      map['current'] = current?.toJson();
    }
    if (forecast != null) {
      map['forecast'] = forecast?.toJson();
    }
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [location, current, forecast];
}

/// name : "London"
/// region : "City of London, Greater London"
/// country : "United Kingdom"
/// lat : 51.52
/// lon : -0.11
/// tz_id : "Europe/London"
/// localtime_epoch : 1685032280
/// localtime : "2023-05-25 17:31"

class LocationEntity extends Equatable {
  LocationEntity({
    this.name,
    this.region,
    this.country,
    this.localtime,
  });

  factory LocationEntity.fromJson(dynamic json) {
    return LocationEntity(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      localtime: json['localtime'],
    );
  }
  final String? name;
  final String? region;
  final String? country;
  final String? localtime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['region'] = region;
    map['country'] = country;
    map['localtime'] = localtime;
    return map;
  }

  @override
  List<Object?> get props => [name, region, country, localtime];

  @override
  bool get stringify => true;
}

/// temp_c : 17.0
/// temp_f : 62.6
/// is_day : 1
/// condition : {"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"}
/// humidity : 55
/// cloud : 75
/// uv : 5.0

class CurrentEntity extends Equatable {
  CurrentEntity({
    this.tempC,
    this.tempF,
    this.condition,
    this.humidity,
    this.uv,
  });

  factory CurrentEntity.fromJson(dynamic json) {
    return CurrentEntity(
      tempC: json['temp_c'],
      tempF: json['temp_f'],
      condition: json['condition'] != null
          ? ConditionEntity.fromJson(json['condition'])
          : null,
      humidity: json['humidity'],
      uv: json['uv'],
    );
  }
  final double? tempC;
  final double? tempF;
  final ConditionEntity? condition;
  final int? humidity;
  final double? uv;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp_c'] = tempC;
    map['temp_f'] = tempF;
    if (condition != null) {
      map['condition'] = condition?.toJson();
    }
    map['humidity'] = humidity;
    map['uv'] = uv;
    return map;
  }

  @override
  List<Object?> get props => [tempC, tempF, condition, humidity, uv];

  @override
  bool get stringify => true;
}

/// forecastday : [{"date":"2023-05-25","day":{"maxtemp_c":20.5,"maxtemp_f":68.9,"mintemp_c":9.9,"mintemp_f":49.8,"avgtemp_c":14.9,"avgtemp_f":58.7,"totalsnow_cm":0.0,"daily_will_it_rain":0,"daily_chance_of_rain":0,"daily_will_it_snow":0,"daily_chance_of_snow":0,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":4.0},"astro":{"sunrise":"04:56 AM","sunset":"09:00 PM","is_moon_up":1,"is_sun_up":0},"hour":[{"time":"2023-05-25 00:00","temp_c":11.5,"temp_f":52.7,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-25 01:00","temp_c":11.0,"temp_f":51.8,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/night/116.png"},"uv":1.0},{"time":"2023-05-25 02:00","temp_c":10.6,"temp_f":51.1,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/night/116.png"},"uv":1.0},{"time":"2023-05-25 03:00","temp_c":10.3,"temp_f":50.5,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-25 04:00","temp_c":9.9,"temp_f":49.8,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-25 05:00","temp_c":10.3,"temp_f":50.5,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":4.0},{"time":"2023-05-25 06:00","temp_c":11.5,"temp_f":52.7,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":4.0},{"time":"2023-05-25 07:00","temp_c":13.0,"temp_f":55.4,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-25 08:00","temp_c":14.6,"temp_f":58.3,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-25 09:00","temp_c":16.2,"temp_f":61.2,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-25 10:00","temp_c":17.5,"temp_f":63.5,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-25 11:00","temp_c":19.4,"temp_f":66.9,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-25 12:00","temp_c":20.5,"temp_f":68.9,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":6.0},{"time":"2023-05-25 13:00","temp_c":20.2,"temp_f":68.4,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":6.0},{"time":"2023-05-25 14:00","temp_c":20.3,"temp_f":68.5,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":6.0},{"time":"2023-05-25 15:00","temp_c":20.0,"temp_f":68.0,"condition":{"text":"Cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/119.png"},"uv":5.0},{"time":"2023-05-25 16:00","temp_c":19.1,"temp_f":66.4,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":5.0},{"time":"2023-05-25 17:00","temp_c":18.0,"temp_f":64.4,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":5.0},{"time":"2023-05-25 18:00","temp_c":17.0,"temp_f":62.6,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":5.0},{"time":"2023-05-25 19:00","temp_c":16.3,"temp_f":61.3,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":5.0},{"time":"2023-05-25 20:00","temp_c":13.9,"temp_f":57.0,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-25 21:00","temp_c":12.6,"temp_f":54.7,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-25 22:00","temp_c":11.8,"temp_f":53.2,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-25 23:00","temp_c":11.1,"temp_f":52.0,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0}]},{"date":"2023-05-26","day":{"maxtemp_c":19.8,"maxtemp_f":67.6,"mintemp_c":8.1,"mintemp_f":46.6,"avgtemp_c":13.4,"avgtemp_f":56.1,"totalsnow_cm":0.0,"daily_will_it_rain":0,"daily_chance_of_rain":0,"daily_will_it_snow":0,"daily_chance_of_snow":0,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},"astro":{"sunrise":"04:55 AM","sunset":"09:01 PM","is_moon_up":1,"is_sun_up":0},"hour":[{"time":"2023-05-26 00:00","temp_c":10.1,"temp_f":50.2,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-26 01:00","temp_c":9.5,"temp_f":49.1,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-26 02:00","temp_c":8.9,"temp_f":48.0,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-26 03:00","temp_c":8.5,"temp_f":47.3,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-26 04:00","temp_c":8.1,"temp_f":46.6,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-26 05:00","temp_c":8.5,"temp_f":47.3,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":3.0},{"time":"2023-05-26 06:00","temp_c":10.0,"temp_f":50.0,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-26 07:00","temp_c":11.7,"temp_f":53.1,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-26 08:00","temp_c":13.4,"temp_f":56.1,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-26 09:00","temp_c":14.9,"temp_f":58.8,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-26 10:00","temp_c":16.0,"temp_f":60.8,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-26 11:00","temp_c":17.3,"temp_f":63.1,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-26 12:00","temp_c":18.0,"temp_f":64.4,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-26 13:00","temp_c":18.8,"temp_f":65.8,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-26 14:00","temp_c":19.8,"temp_f":67.6,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-26 15:00","temp_c":18.6,"temp_f":65.5,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-26 16:00","temp_c":17.8,"temp_f":64.0,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-26 17:00","temp_c":18.5,"temp_f":65.3,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-26 18:00","temp_c":16.3,"temp_f":61.3,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-26 19:00","temp_c":14.7,"temp_f":58.5,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-26 20:00","temp_c":11.6,"temp_f":52.9,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-26 21:00","temp_c":10.7,"temp_f":51.3,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-26 22:00","temp_c":10.1,"temp_f":50.2,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-26 23:00","temp_c":9.5,"temp_f":49.1,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0}]},{"date":"2023-05-27","day":{"maxtemp_c":22.4,"maxtemp_f":72.3,"mintemp_c":7.4,"mintemp_f":45.3,"avgtemp_c":14.3,"avgtemp_f":57.7,"totalsnow_cm":0.0,"daily_will_it_rain":0,"daily_chance_of_rain":0,"daily_will_it_snow":0,"daily_chance_of_snow":0,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},"astro":{"sunrise":"04:54 AM","sunset":"09:02 PM","is_moon_up":1,"is_sun_up":0},"hour":[{"time":"2023-05-27 00:00","temp_c":8.7,"temp_f":47.7,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-27 01:00","temp_c":8.2,"temp_f":46.8,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-27 02:00","temp_c":7.8,"temp_f":46.0,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-27 03:00","temp_c":7.6,"temp_f":45.7,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/night/116.png"},"uv":1.0},{"time":"2023-05-27 04:00","temp_c":7.4,"temp_f":45.3,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/night/116.png"},"uv":1.0},{"time":"2023-05-27 05:00","temp_c":8.0,"temp_f":46.4,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":3.0},{"time":"2023-05-27 06:00","temp_c":9.4,"temp_f":48.9,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":3.0},{"time":"2023-05-27 07:00","temp_c":11.3,"temp_f":52.3,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-27 08:00","temp_c":13.2,"temp_f":55.8,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-27 09:00","temp_c":15.0,"temp_f":59.0,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-27 10:00","temp_c":16.6,"temp_f":61.9,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-27 11:00","temp_c":19.2,"temp_f":66.6,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-27 12:00","temp_c":20.3,"temp_f":68.5,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":6.0},{"time":"2023-05-27 13:00","temp_c":20.0,"temp_f":68.0,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":6.0},{"time":"2023-05-27 14:00","temp_c":22.4,"temp_f":72.3,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":6.0},{"time":"2023-05-27 15:00","temp_c":21.5,"temp_f":70.7,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":6.0},{"time":"2023-05-27 16:00","temp_c":20.7,"temp_f":69.3,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":6.0},{"time":"2023-05-27 17:00","temp_c":19.9,"temp_f":67.8,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-27 18:00","temp_c":18.9,"temp_f":66.0,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-27 19:00","temp_c":17.6,"temp_f":63.7,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-27 20:00","temp_c":13.6,"temp_f":56.5,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-27 21:00","temp_c":12.6,"temp_f":54.7,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-27 22:00","temp_c":11.8,"temp_f":53.2,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-27 23:00","temp_c":11.2,"temp_f":52.2,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0}]}]

class ForecastEntity extends Equatable {
  ForecastEntity({
    this.forecastday,
  });

  factory ForecastEntity.fromJson(dynamic json) {
    return ForecastEntity(
        forecastday: json['forecastday'] != null
            ? json['forecastday']
                .map((v) {
                  ForecastDayEntity.fromJson(v);
                })
                .toList()
                .cast<ForecastDayEntity>()
            : []);
  }
  final List<ForecastDayEntity>? forecastday;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (forecastday != null) {
      map['forecastday'] = forecastday?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  List<Object?> get props => [forecastday];

  @override
  bool get stringify => true;
}

/// date : "2023-05-25"
/// day : {"maxtemp_c":20.5,"maxtemp_f":68.9,"mintemp_c":9.9,"mintemp_f":49.8,"avgtemp_c":14.9,"avgtemp_f":58.7,"totalsnow_cm":0.0,"daily_will_it_rain":0,"daily_chance_of_rain":0,"daily_will_it_snow":0,"daily_chance_of_snow":0,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":4.0}
/// astro : {"sunrise":"04:56 AM","sunset":"09:00 PM","is_moon_up":1,"is_sun_up":0}
/// hour : [{"time":"2023-05-25 00:00","temp_c":11.5,"temp_f":52.7,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-25 01:00","temp_c":11.0,"temp_f":51.8,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/night/116.png"},"uv":1.0},{"time":"2023-05-25 02:00","temp_c":10.6,"temp_f":51.1,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/night/116.png"},"uv":1.0},{"time":"2023-05-25 03:00","temp_c":10.3,"temp_f":50.5,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-25 04:00","temp_c":9.9,"temp_f":49.8,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-25 05:00","temp_c":10.3,"temp_f":50.5,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":4.0},{"time":"2023-05-25 06:00","temp_c":11.5,"temp_f":52.7,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":4.0},{"time":"2023-05-25 07:00","temp_c":13.0,"temp_f":55.4,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-25 08:00","temp_c":14.6,"temp_f":58.3,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-25 09:00","temp_c":16.2,"temp_f":61.2,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-25 10:00","temp_c":17.5,"temp_f":63.5,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-25 11:00","temp_c":19.4,"temp_f":66.9,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":5.0},{"time":"2023-05-25 12:00","temp_c":20.5,"temp_f":68.9,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":6.0},{"time":"2023-05-25 13:00","temp_c":20.2,"temp_f":68.4,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":6.0},{"time":"2023-05-25 14:00","temp_c":20.3,"temp_f":68.5,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":6.0},{"time":"2023-05-25 15:00","temp_c":20.0,"temp_f":68.0,"condition":{"text":"Cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/119.png"},"uv":5.0},{"time":"2023-05-25 16:00","temp_c":19.1,"temp_f":66.4,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":5.0},{"time":"2023-05-25 17:00","temp_c":18.0,"temp_f":64.4,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":5.0},{"time":"2023-05-25 18:00","temp_c":17.0,"temp_f":62.6,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":5.0},{"time":"2023-05-25 19:00","temp_c":16.3,"temp_f":61.3,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"},"uv":5.0},{"time":"2023-05-25 20:00","temp_c":13.9,"temp_f":57.0,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png"},"uv":4.0},{"time":"2023-05-25 21:00","temp_c":12.6,"temp_f":54.7,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-25 22:00","temp_c":11.8,"temp_f":53.2,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0},{"time":"2023-05-25 23:00","temp_c":11.1,"temp_f":52.0,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"},"uv":1.0}]

class ForecastDayEntity extends Equatable {
  ForecastDayEntity({
    this.date,
    this.day,
    this.astro,
    this.hour,
  });

  factory ForecastDayEntity.fromJson(dynamic json) {
    return ForecastDayEntity(
      date: json['date'],
      day: json['day'] != null ? DayEntity.fromJson(json['day']) : null,
      astro: json['astro'] != null ? AstroEntity.fromJson(json['astro']) : null,
      hour: json['hour'] != null
          ? json['hour'].map((v) {
              HourEntity.fromJson(v);
            }).toList()
          : [],
    );
  }
  final String? date;
  final DayEntity? day;
  final AstroEntity? astro;
  final List<HourEntity>? hour;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    if (day != null) {
      map['day'] = day?.toJson();
    }
    if (astro != null) {
      map['astro'] = astro?.toJson();
    }
    if (hour != null) {
      map['hour'] = hour?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  List<Object?> get props => [date, day, astro, hour];

  @override
  bool get stringify => true;
}

/// time : "2023-05-25 00:00"
/// temp_c : 11.5
/// temp_f : 52.7
/// condition : {"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png"}
/// uv : 1.0

class HourEntity extends Equatable {
  HourEntity({
    this.time,
    this.tempC,
    this.tempF,
    this.condition,
    this.uv,
  });

  factory HourEntity.fromJson(dynamic json) {
    return HourEntity(
      time: json['time'],
      tempC: json['temp_c'],
      tempF: json['temp_f'],
      condition: json['condition'] != null
          ? ConditionEntity.fromJson(json['condition'])
          : null,
      uv: json['uv'],
    );
  }
  final String? time;
  final double? tempC;
  final double? tempF;
  final ConditionEntity? condition;
  final double? uv;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['temp_c'] = tempC;
    map['temp_f'] = tempF;
    if (condition != null) {
      map['condition'] = condition?.toJson();
    }
    map['uv'] = uv;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [time, tempC, tempF, condition, uv];

  @override
  bool? get stringify => true;
}

/// text : "Clear"
/// icon : "//cdn.weatherapi.com/weather/64x64/night/113.png"

class ConditionEntity extends Equatable {
  ConditionEntity({
    this.text,
    this.icon,
  });

  factory ConditionEntity.fromJson(dynamic json) {
    return ConditionEntity(
      text: json['text'],
      icon: json['icon'],
    );
  }
  final String? text;
  final String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['icon'] = icon;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [text, icon];

  @override
  bool? get stringify => true;
}

/// sunrise : "04:56 AM"
/// sunset : "09:00 PM"
/// is_moon_up : 1
/// is_sun_up : 0

class AstroEntity extends Equatable {
  AstroEntity({
    this.sunrise,
    this.sunset,
  });

  factory AstroEntity.fromJson(dynamic json) {
    return AstroEntity(
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
  final String? sunrise;
  final String? sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [sunrise, sunset];

  @override
  bool? get stringify => true;
}

/// maxtemp_c : 20.5
/// maxtemp_f : 68.9
/// mintemp_c : 9.9
/// mintemp_f : 49.8
/// avgtemp_c : 14.9
/// avgtemp_f : 58.7
/// totalsnow_cm : 0.0
/// daily_will_it_rain : 0
/// daily_chance_of_rain : 0
/// daily_will_it_snow : 0
/// daily_chance_of_snow : 0
/// condition : {"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png"}
/// uv : 4.0

class DayEntity extends Equatable {
  DayEntity({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.condition,
    this.uv,
  });

  factory DayEntity.fromJson(dynamic json) {
    return DayEntity(
      maxtempC: json['maxtemp_c'],
      maxtempF: json['maxtemp_f'],
      mintempC: json['mintemp_c'],
      mintempF: json['mintemp_f'],
      avgtempC: json['avgtemp_c'],
      avgtempF: json['avgtemp_f'],
      condition: json['condition'] != null
          ? ConditionEntity.fromJson(json['condition'])
          : null,
      uv: json['uv'],
    );
  }
  final double? maxtempC;
  final double? maxtempF;
  final double? mintempC;
  final double? mintempF;
  final double? avgtempC;
  final double? avgtempF;
  final ConditionEntity? condition;
  final double? uv;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maxtemp_c'] = maxtempC;
    map['maxtemp_f'] = maxtempF;
    map['mintemp_c'] = mintempC;
    map['mintemp_f'] = mintempF;
    map['avgtemp_c'] = avgtempC;
    map['avgtemp_f'] = avgtempF;

    if (condition != null) {
      map['condition'] = condition?.toJson();
    }
    map['uv'] = uv;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [maxtempC, maxtempF, mintempC, mintempF, avgtempC, avgtempF];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}
