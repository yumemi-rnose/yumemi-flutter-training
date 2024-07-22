enum WeatherType {
  sunny,
  cloudy,
  rainy,
}

class Weather {
  Weather(this.weatherType, this.maxTemperature, this.minTemperature);
  final WeatherType weatherType;
  final int maxTemperature;
  final int minTemperature;
}
