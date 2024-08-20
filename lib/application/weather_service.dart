import 'package:flutter_training/domain/weather.dart';

abstract class WeatherRepository {
  Future<Weather> findBy(String area, DateTime date);
}

class WeatherService {
  // コンストラクタ
  WeatherService(this._repository);

  final WeatherRepository _repository;

  Future<Weather> fetchWeather() {
    return _repository.findBy('tokyo', DateTime.now());
  }
}
