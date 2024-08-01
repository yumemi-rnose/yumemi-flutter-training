import 'dart:convert';

import 'package:flutter_training/application/weather_service.dart';
import 'package:flutter_training/domain/app_exceptions.dart';
import 'package:flutter_training/domain/weather.dart';
import 'package:flutter_training/repository/weather_get_request.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherRepository with FetchWeatherMixin {
  final YumemiWeather _client = YumemiWeather();

  @override
  Weather execute() {
    try {
      final request =
          json.encode(WeatherGetRequest(area: 'tokyo', date: DateTime.now()));
      final responseJsonString = _client.fetchWeather(request);
      return Weather.fromJson(
        json.decode(responseJsonString) as Map<String, dynamic>,
      );
    } on YumemiWeatherError catch (e) {
      throw switch (e) {
        YumemiWeatherError.invalidParameter =>
          WeatherInvalidParameterException(),
        YumemiWeatherError.unknown => WeatherUnknownException(),
      };
    }
  }
}
