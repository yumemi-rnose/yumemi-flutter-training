class WeatherGetRequest {
  WeatherGetRequest(this.area, this.date);

  final String area;
  final DateTime date;

  Map<String, dynamic> toJson() => {
        'area': area,
        'date': date.toString(),
      };
}
