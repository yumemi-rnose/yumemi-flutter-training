import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_get_request.freezed.dart';
part 'weather_get_request.g.dart';

@freezed
class WeatherGetRequest with _$WeatherGetRequest {
  factory WeatherGetRequest({
    required String area,
    required DateTime date,
  }) = _WeatherGetRequest;

  factory WeatherGetRequest.fromJson(Map<String, dynamic> json) =>
      _$WeatherGetRequestFromJson(json);
}
