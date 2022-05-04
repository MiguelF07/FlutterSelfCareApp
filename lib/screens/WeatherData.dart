class WeatherData {
  final String country;
  final String date;
  final String region;
  final String probPrec;
  final String tMin;
  final String tMax;
  final String windDir;

  const WeatherData(
      {required this.country,
      required this.date,
      required this.region,
      required this.probPrec,
      required this.tMin,
      required this.tMax,
      required this.windDir});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
        country: json['country'],
        date: json['data'][0]['forecastDate'],
        region: "Aveiro", //Api fetches location of Aveiro,
        probPrec: json['data'][0]['precipitaProb'],
        tMin: json['data'][0]['tMin'],
        tMax: json['data'][0]['tMax'],
        windDir: json['data'][0]['predWindDir']);
  }
}
