import 'package:flutter_training/application/providers.dart';
import 'package:flutter_training/domain/weather.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_screen_state.g.dart';

@riverpod
class WeatherScreenState extends _$WeatherScreenState {
  @override
  Weather? build() => null;

  void fetch() {
    final service = ref.watch(weatherServiceProvider);
    state = service.fetchWeather();
  }
}
