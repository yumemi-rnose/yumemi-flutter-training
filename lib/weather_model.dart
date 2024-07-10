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
    return WeatherType.values.firstWhere(
      (element) => element.name == response,
      orElse: () => WeatherType.none,
    );
  }
}
