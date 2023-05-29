import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_detail_widget.dart';
import '../../../di/get_it.dart';
import 'weather_detail_argument.dart';
import '../../blocs/favourite/favourite_cubit.dart';
import '../../blocs/weather_detail/weather_detail_bloc.dart';
import '../../widgets/app_error_widget.dart';

class WeatherDetailScreen extends StatefulWidget {
  final WeatherDetailArguments weatherDetailArguments;

  const WeatherDetailScreen({Key? key, required this.weatherDetailArguments})
      : super(key: key);

  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  late WeatherDetailBloc weatherDetailBloc;
  late FavoriteCubit favoriteCubit;

  @override
  void initState() {
    weatherDetailBloc = getItInstance<WeatherDetailBloc>();
    weatherDetailBloc.add(LoadWeatherDetailEvent(
        widget.weatherDetailArguments.cityName.toLowerCase().trim()));
    favoriteCubit = weatherDetailBloc.favoriteCubit;
    super.initState();
  }

  @override
  void dispose() {
    weatherDetailBloc.close();
    favoriteCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: weatherDetailBloc),
          BlocProvider.value(value: favoriteCubit),
        ],
        child: BlocBuilder<WeatherDetailBloc, WeatherDetailState>(
          builder: (context, state) {
            if (state is WeatherDetailLoadedState) {
              return WeatherDetailWidget(weather: state.weather);
            } else if (state is WeatherDetailErrorState) {
              return AppErrorWidget(
                errorType: state.errorType,
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            }
            return SizedBox.shrink();
          },
        ));
  }
}
