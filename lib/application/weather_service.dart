import 'package:flutter_training/domain/weather.dart';

mixin FetchWeatherMixin {
  Weather execute();
}

class WeatherService {
  // コンストラクタ
  WeatherService(this._fetcher);

  final FetchWeatherMixin _fetcher;

  Weather fetchWeather() {
    return _fetcher.execute();
  }
}
