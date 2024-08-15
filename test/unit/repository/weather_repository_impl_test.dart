import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/domain/app_exceptions.dart';
import 'package:flutter_training/domain/weather.dart';
import 'package:flutter_training/repository/providers.dart';
import 'package:flutter_training/repository/weather_get_request.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import 'weather_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<YumemiWeather>()])
void main() {
  ProviderContainer makeProviderContainer(
    MockYumemiWeather mockYumemiWeather,
  ) {
    final container = ProviderContainer(
      overrides: [
        yumemiWeatherProvider.overrideWithValue(mockYumemiWeather),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  final mockYumemiWeather = MockYumemiWeather();
  group('WeatherRepository findBy test', () {
    test('findBy should be successfully decoded as Weather when expected json.',
        () {
      const area = 'area';
      final date = DateTime.now();
      final jsonString = json.encode(
        WeatherGetRequest(
          area: area,
          date: date,
        ),
      );
      final result =
          '''{"weather_condition":"rainy","max_temperature":30,"min_temperature":22,"date":"$date"}''';
      when(mockYumemiWeather.syncFetchWeather(jsonString)).thenReturn(result);

      final container = makeProviderContainer(mockYumemiWeather);
      final target = container.read(weatherRepositoryProvider);

      final actual = Weather.fromJson(
        json.decode(result) as Map<String, dynamic>,
      );

      expect(actual, target.findBy(area, date));

      verify(mockYumemiWeather.syncFetchWeather(jsonString));
    });
    test(
      '''findBy should be thrown CheckedFromJsonException when value not in WeatherType is returned.''',
      () {
        const area = 'area';
        final date = DateTime.now();
        final jsonString = json.encode(
          WeatherGetRequest(
            area: area,
            date: date,
          ),
        );
        final result =
            '''{"weather_condition":"storm","max_temperature":30,"min_temperature":22,"date":"$date"}''';
        when(mockYumemiWeather.syncFetchWeather(jsonString)).thenReturn(result);

        final container = makeProviderContainer(mockYumemiWeather);
        final target = container.read(weatherRepositoryProvider);

        // ignore: unnecessary_lambdas
        expect(
          () => target.findBy(area, date),
          throwsA(isA<CheckedFromJsonException>()),
        );

        verify(mockYumemiWeather.syncFetchWeather(jsonString));
      },
    );
    test(
      '''findBy should be thrown WeatherUnknownException when YumemiWeatherError.unknown is thrown''',
      () {
        const area = 'area';
        final date = DateTime.now();
        final jsonString = json.encode(
          WeatherGetRequest(
            area: area,
            date: date,
          ),
        );
        when(mockYumemiWeather.syncFetchWeather(jsonString)).thenThrow(
          YumemiWeatherError.unknown,
        );

        final container = makeProviderContainer(mockYumemiWeather);
        final target = container.read(weatherRepositoryProvider);

        // ignore: unnecessary_lambdas
        expect(
          () => target.findBy(area, date),
          throwsA(isA<WeatherUnknownException>()),
        );

        verify(mockYumemiWeather.syncFetchWeather(jsonString));
      },
    );
    test(
      '''findBy should be thrown WeatherInvalidParameterException when YumemiWeatherError.invalidParameter is thrown''',
      () {
        const area = 'area';
        final date = DateTime.now();
        final jsonString = json.encode(
          WeatherGetRequest(
            area: area,
            date: date,
          ),
        );
        when(mockYumemiWeather.syncFetchWeather(jsonString)).thenThrow(
          YumemiWeatherError.invalidParameter,
        );

        final container = makeProviderContainer(mockYumemiWeather);
        final target = container.read(weatherRepositoryProvider);

        // ignore: unnecessary_lambdas
        expect(
          () => target.findBy(area, date),
          throwsA(isA<WeatherInvalidParameterException>()),
        );

        verify(mockYumemiWeather.syncFetchWeather(jsonString));
      },
    );
  });
}
