import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/application/providers.dart';
import 'package:flutter_training/application/weather_service.dart';
import 'package:flutter_training/domain/app_exceptions.dart';
import 'package:flutter_training/domain/weather.dart';
import 'package:flutter_training/ui/screen/weather/weather_screen_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_screen_state_test.mocks.dart';

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
    test('fetch Shuold state is not null When normal case', () {
      final weather = Weather(
        weatherType: WeatherType.sunny,
        maxTemperature: 0,
        minTemperature: -10,
      );

      when(mockService.fetchWeather()).thenReturn(weather);

      final container = makeProviderContainer(mockService);
      final target = container.read(weatherScreenStateProvider.notifier);

      target.fetch();

      final actual = container.read(weatherScreenStateProvider);

      expect(
        weather,
        actual,
      );

      verify(mockService.fetchWeather()).called(1);
    });
    test('fetch Shuold state not be updated When fetch failed', () {
      when(mockService.fetchWeather()).thenThrow(NotFoundException());

      final container = makeProviderContainer(mockService);
      final target = container.read(weatherScreenStateProvider.notifier);

      // ignore: unnecessary_lambdas
      expect(() => target.fetch(), throwsA(isA<NotFoundException>()));
      expect(null, container.read(weatherScreenStateProvider));
    });
  });
}
