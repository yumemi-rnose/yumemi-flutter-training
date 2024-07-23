// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_get_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherGetResponse _$WeatherGetResponseFromJson(Map<String, dynamic> json) =>
    WeatherGetResponse(
      json['weather_condition'] as String,
      (json['max_temperature'] as num).toInt(),
      (json['min_temperature'] as num).toInt(),
    );
