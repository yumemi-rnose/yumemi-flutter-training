import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

enum WeatherType {
  sunny,
  cloudy,
  rainy,
}

@JsonSerializable()
class Weather {
  Weather(this.weatherType, this.maxTemperature, this.minTemperature);
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  @JsonKey(name: 'weather_condition')
  final WeatherType weatherType;
  @JsonKey(name: 'max_temperature')
  final int maxTemperature;
  @JsonKey(name: 'min_temperature')
  final int minTemperature;
}
