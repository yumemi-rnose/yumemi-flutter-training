import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/application/providers.dart';
import 'package:flutter_training/application/weather_service.dart';
import 'package:flutter_training/domain/app_exceptions.dart';
import 'package:flutter_training/domain/weather.dart';
import 'package:flutter_training/ui/screen/weather/weather_screen_state.dart';
import 'package:flutter_training/ui/screen/weather/weather_screen_state_notifier.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_screen_state_notifier_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WeatherService>()])
void main() {
  ProviderContainer makeProviderContainer(
    MockWeatherService mockService,
  ) {
    final container = ProviderContainer(
      overrides: [
        weatherServiceProvider.overrideWithValue(mockService),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  final mockService = MockWeatherService();

  group('WeatherScreenState Test', () {
    test('fetch should state is not null When normal case', () async {
      final weather = Weather(
        weatherType: WeatherType.sunny,
        maxTemperature: 0,
        minTemperature: -10,
      );

      when(mockService.fetchWeather()).thenAnswer((_) async => weather);

      final container = makeProviderContainer(mockService);
      final target =
          container.read(weatherScreenStateNotifierProvider.notifier);

      await target.fetch();

      final expected = WeatherScreenState(weather: weather);
      final actual = container.read(weatherScreenStateNotifierProvider);

      expect(expected.weather, actual.weather);
      expect(expected.isLoading, actual.isLoading);

      verify(mockService.fetchWeather());
    });
    test('fetch should state not be updated When fetch failed', () async {
      when(mockService.fetchWeather()).thenThrow(WeatherUnknownException());

      final container = makeProviderContainer(mockService);
      final target =
          container.read(weatherScreenStateNotifierProvider.notifier);

      // ignore: unnecessary_lambdas
      expect(() => target.fetch(), throwsA(isA<WeatherUnknownException>()));
      expect(null, container.read(weatherScreenStateNotifierProvider).weather);
    });
  });
}
