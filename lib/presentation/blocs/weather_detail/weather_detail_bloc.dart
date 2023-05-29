import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/forecast_weather_params.dart';
import '../../../domain/entities/weather_entity.dart';
import '../../../domain/usecases/get_forecast_weather.dart';
import '../favourite/favourite_cubit.dart';
import '../loading/loading_cubit.dart';

part 'weather_detail_event.dart';
part 'weather_detail_state.dart';

class WeatherDetailBloc extends Bloc<WeatherDetailEvent, WeatherDetailState> {
  final GetForecastWeather getForecastWeather;
  final LoadingCubit loadingCubit;
  final FavoriteCubit favoriteCubit;
  WeatherDetailBloc(
      {required this.loadingCubit,
      required this.getForecastWeather,
      required this.favoriteCubit})
      : super(WeatherDetailInitial());

  @override
  Stream<WeatherDetailState> mapEventToState(WeatherDetailEvent event) async* {
    if (event is LoadWeatherDetailEvent) {
      loadingCubit.show();
      final moviesEither = await getForecastWeather(
          ForecastWeatherParams(cityName: event.cityName));
      yield moviesEither.fold((l) => WeatherDetailErrorState(l.appErrorType),
          (weather) => WeatherDetailLoadedState(weather: weather));
      loadingCubit.hide();
      favoriteCubit.checkIfFavouriteCity(event.cityName);
    }
  }
}
