import 'package:flutter_training/application/weather_service.dart';
import 'package:flutter_training/repository/weather_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'providers.g.dart';

@riverpod
WeatherRepository weatherRepository(WeatherRepositoryRef ref) =>
    WeatherRepositoryImpl(ref.watch(yumemiWeatherProvider));

@riverpod
YumemiWeather yumemiWeather(YumemiWeatherRef ref) => YumemiWeather();
