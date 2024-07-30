import 'package:flutter_training/application/weather_service.dart';
import 'package:flutter_training/repository/weather_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
FetchWeatherMixin fetchWeatherMixin(FetchWeatherMixinRef ref) =>
    WeatherRepository();
