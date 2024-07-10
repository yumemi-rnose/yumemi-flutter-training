import 'package:yumemi_weather/yumemi_weather.dart';

enum WeatherType {
  none,
  sunny,
  cloudy,
  rainy,
}

class WeatherModel {
  // コンストラクタ
  WeatherModel(this._client);

  final YumemiWeather _client;

  WeatherType fetchCondition() {
    final response = _client.fetchSimpleWeather();
    try {
      return WeatherType.values.byName(response);
    } on Exception catch (_) {
      return WeatherType.none;
    }
  }
}
