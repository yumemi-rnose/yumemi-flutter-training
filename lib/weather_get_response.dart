import 'package:flutter_training/app_exceptions.dart';
import 'package:flutter_training/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_get_response.g.dart';

@JsonSerializable()
class WeatherGetResponse {
  WeatherGetResponse(
    this.weatherCondition,
    this.maxTemperature,
    this.minTemperature,
  );

  factory WeatherGetResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherGetResponseFromJson(json);

  @JsonKey(name: 'weather_condition')
  final String weatherCondition;
  @JsonKey(name: 'max_temperature')
  final int maxTemperature;
  @JsonKey(name: 'min_temperature')
  final int minTemperature;

  Weather toWeather() {
    return Weather(
      WeatherType.values.firstWhere(
        (element) => element.name == weatherCondition,
        orElse: () => throw NotFoundException(),
      ),
      maxTemperature,
      minTemperature,
    );
  }
}
