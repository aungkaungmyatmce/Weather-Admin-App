part of 'weather_detail_bloc.dart';

abstract class WeatherDetailEvent extends Equatable {
  const WeatherDetailEvent();
}

class LoadWeatherDetailEvent extends WeatherDetailEvent {
  final String cityName;
  LoadWeatherDetailEvent(this.cityName);

  @override
  List<Object?> get props => [cityName];
}
