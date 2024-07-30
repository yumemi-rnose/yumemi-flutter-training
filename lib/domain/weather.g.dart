// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$WeatherImpl',
      json,
      ($checkedConvert) {
        final val = _$WeatherImpl(
          weatherType: $checkedConvert(
              'weather_condition', (v) => $enumDecode(_$WeatherTypeEnumMap, v)),
          maxTemperature:
              $checkedConvert('max_temperature', (v) => (v as num).toInt()),
          minTemperature:
              $checkedConvert('min_temperature', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'weatherType': 'weather_condition',
        'maxTemperature': 'max_temperature',
        'minTemperature': 'min_temperature'
      },
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'weather_condition': _$WeatherTypeEnumMap[instance.weatherType]!,
      'max_temperature': instance.maxTemperature,
      'min_temperature': instance.minTemperature,
    };

const _$WeatherTypeEnumMap = {
  WeatherType.sunny: 'sunny',
  WeatherType.cloudy: 'cloudy',
  WeatherType.rainy: 'rainy',
};
