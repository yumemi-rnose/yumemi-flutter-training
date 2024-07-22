import 'package:flutter_training/app_exceptions.dart';
import 'package:flutter_training/weather.dart';

class WeatherGetResponse {
  WeatherGetResponse(
    this.weatherCondition,
    this.maxTemperature,
    this.minTemperature,
  );

  factory WeatherGetResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'weather_condition': final String weatherCondition,
        'max_temperature': final int maxTemperature,
        'min_temperature': final int minTemperature,
      } =>
        WeatherGetResponse(
          weatherCondition,
          maxTemperature,
          minTemperature,
        ),
      _ => throw const FormatException('Failed to object.'),
    };
  }

  final String weatherCondition;
  final int maxTemperature;
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
