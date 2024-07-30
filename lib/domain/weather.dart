import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

enum WeatherType {
  sunny,
  cloudy,
  rainy,
}

@freezed
class Weather with _$Weather {
  factory Weather({
    @JsonKey(name: 'weather_condition') required WeatherType weatherType,
    @JsonKey(name: 'max_temperature') required int maxTemperature,
    @JsonKey(name: 'min_temperature') required int minTemperature,
  }) = _Weather;

  factory Weather.fromJson(Map<String, Object?> json) =>
      _$WeatherFromJson(json);
}
