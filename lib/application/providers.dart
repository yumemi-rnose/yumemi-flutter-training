import 'package:flutter_training/application/weather_service.dart';
import 'package:flutter_training/repository/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
WeatherService weatherService(WeatherServiceRef ref) =>
    WeatherService(ref.watch(fetchWeatherMixinProvider));
