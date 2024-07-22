import 'dart:convert';

import 'package:flutter_training/app_exceptions.dart';
import 'package:flutter_training/weather.dart';
import 'package:flutter_training/weather_get_request.dart';
import 'package:flutter_training/weather_get_response.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherModel {
  // コンストラクタ
  WeatherModel(this._client);

  final YumemiWeather _client;

  WeatherType fetchCondition() {
    try {
      final request =
          jsonEncode(WeatherGetRequest('tokyo', DateTime.now()).toJson());
      final responseJsonString = _client.fetchWeather(request);
      final response = WeatherGetResponse.fromJson(
        json.decode(responseJsonString) as Map<String, dynamic>,
      );
      return response.toWeather().weatherType;
    } on YumemiWeatherError catch (e) {
      throw switch (e) {
        YumemiWeatherError.invalidParameter =>
          WeatherInvalidParameterException(),
        YumemiWeatherError.unknown => WeatherUnknownException(),
      };
    }
  }
}
