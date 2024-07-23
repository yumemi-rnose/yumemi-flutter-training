// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      $enumDecode(_$WeatherTypeEnumMap, json['weather_condition']),
      (json['max_temperature'] as num).toInt(),
      (json['min_temperature'] as num).toInt(),
    );

const _$WeatherTypeEnumMap = {
  WeatherType.sunny: 'sunny',
  WeatherType.cloudy: 'cloudy',
  WeatherType.rainy: 'rainy',
};
