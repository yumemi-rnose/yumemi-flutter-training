// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'weather_get_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherGetRequestImpl _$$WeatherGetRequestImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$WeatherGetRequestImpl',
      json,
      ($checkedConvert) {
        final val = _$WeatherGetRequestImpl(
          area: $checkedConvert('area', (v) => v as String),
          date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$WeatherGetRequestImplToJson(
        _$WeatherGetRequestImpl instance) =>
    <String, dynamic>{
      'area': instance.area,
      'date': instance.date.toIso8601String(),
    };
