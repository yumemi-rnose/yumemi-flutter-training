import 'package:json_annotation/json_annotation.dart';

part 'weather_get_request.g.dart';

@JsonSerializable()
class WeatherGetRequest {
  WeatherGetRequest(this.area, this.date);

  final String area;
  final DateTime date;

  Map<String, dynamic> toJson() => _$WeatherGetRequestToJson(this);
}
