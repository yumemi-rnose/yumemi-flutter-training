import 'package:flutter_training/domain/weather.dart';
import 'package:flutter_training/repository/weather_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_service.g.dart';

@riverpod
WeatherService weatherService(WeatherServiceRef ref) =>
    WeatherService(ref.watch(fetchWeatherMixinProvider));

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
