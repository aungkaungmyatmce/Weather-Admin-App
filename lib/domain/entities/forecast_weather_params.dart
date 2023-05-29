import 'package:equatable/equatable.dart';

class ForecastWeatherParams extends Equatable {
  final String cityName;
  final int days;
  ForecastWeatherParams({required this.cityName, this.days = 3});

  Map<String, dynamic> toJson() => {
        'q': cityName,
        'days': days,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [cityName, days];
}
