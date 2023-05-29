import 'package:equatable/equatable.dart';

class CurrentWeatherParams extends Equatable {
  final String cityName;
  CurrentWeatherParams({required this.cityName});

  Map<String, dynamic> toJson() => {
        'q': cityName,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [cityName];
}
