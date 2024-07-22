class NotFoundException implements Exception {
  final String _message = 'Not Found.';
  @override
  String toString() => _message;
}

// YumemiWeatherError.invalidParameter
class WeatherInvalidParameterException implements Exception {
  final String _message = 'WeatherInvalidParameterException';
  @override
  String toString() => _message;
}

// YumemiWeatherError.unknown
class WeatherUnknownException implements Exception {
  final String _message = 'WeatherUnknownException';
  @override
  String toString() => _message;
}