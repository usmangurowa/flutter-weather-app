class Weather {
  DateTime date;
  double temperature;
  double humidity;
  double wind;
  String weatherCondition;
  String location;

  Weather({
    required this.date,
    required this.temperature,
    required this.wind,
    required this.humidity,
    required this.weatherCondition,
    required this.location,
  });
}
