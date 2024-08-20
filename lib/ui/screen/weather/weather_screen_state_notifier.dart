import 'package:flutter_training/application/providers.dart';
import 'package:flutter_training/application/weather_service.dart';
import 'package:flutter_training/ui/screen/weather/weather_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_screen_state_notifier.g.dart';

@riverpod
class WeatherScreenStateNotifier extends _$WeatherScreenStateNotifier {
  @override
  WeatherScreenState build() => WeatherScreenState();

  WeatherService get _weatherService => ref.watch(weatherServiceProvider);

  Future<void> fetch() async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _weatherService.fetchWeather();
      state = state.copyWith(isLoading: false, weather: result);
    } on Exception catch (_) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
