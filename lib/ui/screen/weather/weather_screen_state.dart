import 'package:flutter_training/domain/weather.dart';

class WeatherScreenState {
  WeatherScreenState({this.isLoading = false, this.weather});

  final bool isLoading;
  final Weather? weather;

  WeatherScreenState copyWith({bool? isLoading, Weather? weather}) {
    return WeatherScreenState(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
    );
  }
}
