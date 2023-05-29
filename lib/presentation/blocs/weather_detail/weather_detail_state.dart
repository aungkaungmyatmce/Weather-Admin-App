part of 'weather_detail_bloc.dart';

abstract class WeatherDetailState extends Equatable {
  const WeatherDetailState();
}

class WeatherDetailInitial extends WeatherDetailState {
  @override
  List<Object> get props => [];
}

class WeatherDetailLoadedState extends WeatherDetailState {
  final WeatherEntity weather;

  WeatherDetailLoadedState({required this.weather});
  @override
  List<Object> get props => [weather];
}

class WeatherDetailErrorState extends WeatherDetailState {
  final AppErrorType errorType;

  WeatherDetailErrorState(this.errorType);
  @override
  List<Object> get props => [];
}
