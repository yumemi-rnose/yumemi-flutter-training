import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/application/providers.dart';
import 'package:flutter_training/domain/weather.dart';
import 'package:flutter_training/repository/providers.dart';
import 'package:flutter_training/repository/weather_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WeatherRepository>()])
void main() {
  ProviderContainer makeProviderContainer(
    MockWeatherRepository weatherRepository,
  ) {
    final container = ProviderContainer(
      overrides: [
        fetchWeatherMixinProvider.overrideWithValue(weatherRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  final mockRepository = MockWeatherRepository();

  test('fetchWeather should return Weather when normal case', () {
    final weather = Weather(
      weatherType: WeatherType.sunny,
      maxTemperature: 0,
      minTemperature: -10,
    );

    when(mockRepository.execute()).thenReturn(weather);

    final container = makeProviderContainer(mockRepository);
    final target = container.read(weatherServiceProvider);

    expect(
      weather,
      target.fetchWeather(),
    );

    verify(mockRepository.execute()).called(1);
  });
}
