import 'package:yumemi_weather/yumemi_weather.dart';

enum WeatherType {
  none,
  sunny,
  cloudy,
  rainy,
}

// YumemiWeatherError.invalidParameter
class WeatherInvalidParameterException implements Exception {
  final String _message = 'WeatherInvalidParameterException';
  @override
  String toString() => _message;
}

// YumemiWeatherError.unknown
class WeatherUnknownException implements Exception {
  final String _message = 'WeatherUnknownException';
  @override
  String toString() => _message;
}

class WeatherModel {
  // コンストラクタ
  WeatherModel(this._client);

  final YumemiWeather _client;

  WeatherType fetchCondition() {
    try {
      final response = _client.fetchThrowsWeather('tokyo');
      return WeatherType.values.firstWhere(
        (element) => element.name == response,
        orElse: () => WeatherType.none,
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
