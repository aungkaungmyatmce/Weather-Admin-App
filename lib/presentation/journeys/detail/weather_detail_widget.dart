import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../common/constants/size_constants.dart';
import '../../../data/core/network/api_constants.dart';
import '../../../domain/entities/weather_entity.dart';
import '../../blocs/favourite/favourite_cubit.dart';
import 'format_date_widget.dart';

class WeatherDetailWidget extends StatelessWidget {
  final WeatherEntity weather;
  const WeatherDetailWidget({Key? key, required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is IsFavouriteCity) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<FavoriteCubit>(context).toggleFavouriteCity(
                        cityName: weather.location!.name!,
                        isFavourite: state.isCityFavourite);
                  },
                  child: Icon(
                    state.isCityFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.white,
                    size: Sizes.dimen_12.h,
                  ),
                );
              } else {
                return Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: Sizes.dimen_12.h,
                );
              }
            },
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.network(
                  '${ApiConstants.BASE_IMAGE_URL}${weather.current!.condition!.icon!}',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                Text(
                  weather.location!.name!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "${weather.current!.tempC!.toStringAsFixed(0)}° C",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  weather.current!.condition!.text!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            SizedBox(
              width: 100,
            ),
            SizedBox(height: Sizes.dimen_60),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Text(
                      'Today',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Divider(
                      color: Colors.white30,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: weather.forecast!.forecastday!.first!.hour!
                            .map((hour) => Container(
                                  width: 80,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      FormatDateWidget(
                                        dateTimeString: hour.time!,
                                        formatPattern: 'hh:mm a',
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Image.network(
                                        '${ApiConstants.BASE_IMAGE_URL}${weather.current!.condition!.icon!}',
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.cover,
                                      ),
                                      Text(
                                        '${hour.tempC.toString()} °',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: Sizes.dimen_60),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Text(
                      '3 Day Weather Forecast',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Divider(
                      color: Colors.white30,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: weather.forecast!.forecastday!
                            .map((day) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FormatDateWidget(
                                      dateTimeString: day!.date!,
                                      formatPattern: 'dd/MM/yyyy',
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleMedium!,
                                    ),
                                    Image.network(
                                      '${ApiConstants.BASE_IMAGE_URL}${day!.day!.condition!.icon!}',
                                      width: 30,
                                      height: 35,
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      '${day!.day!.maxtempC}°       ${day!.day!.mintempC}°',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!,
                                    )
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
    ;
  }
}
