import 'package:equatable/equatable.dart';

class CityParams extends Equatable {
  final String cityName;

  CityParams(this.cityName);

  @override
  List<Object?> get props => [cityName];
}
