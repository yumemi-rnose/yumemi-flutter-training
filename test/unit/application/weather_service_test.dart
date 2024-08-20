import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/application/providers.dart';
import 'package:flutter_training/domain/weather.dart';
import 'package:flutter_training/repository/providers.dart';
import 'package:flutter_training/repository/weather_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WeatherRepositoryImpl>()])
void main() {
  ProviderContainer makeProviderContainer(
    MockWeatherRepositoryImpl weatherRepository,
  ) {
    final container = ProviderContainer(
      overrides: [
        weatherRepositoryProvider.overrideWithValue(weatherRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  final mockRepository = MockWeatherRepositoryImpl();

  test('fetchWeather should return Weather when normal case', () async {
    final weather = Weather(
      weatherType: WeatherType.sunny,
      maxTemperature: 0,
      minTemperature: -10,
    );
    const area = 'tokyo';
    when(mockRepository.findBy(area, any)).thenAnswer((_) async => weather);

    final container = makeProviderContainer(mockRepository);
    final target = container.read(weatherServiceProvider);

    final actual = await target.fetchWeather();
    expect(weather, actual);

    verify(mockRepository.findBy(area, any)).called(1);
  });
}
