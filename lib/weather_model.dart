import 'dart:convert';

import 'package:flutter_training/app_exceptions.dart';
import 'package:flutter_training/weather.dart';
import 'package:flutter_training/weather_get_request.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherModel {
  // コンストラクタ
  WeatherModel(this._client);

  final YumemiWeather _client;

  Weather fetchWeather() {
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
