class Weather {
  final String cityName;
  final String tamperature;
  final String feelsLike;
  final int humidity;
  final String description;
  final String main;
  final String icon;
  final double windSpeed;
  final String country;

  Weather({
    required this.cityName,
    required this.tamperature,
    required this.feelsLike,
    required this.humidity,
    required this.description,
    required this.main,
    required this.icon,
    required this.windSpeed,
    required this.country,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        cityName: json['name'],
        tamperature: json['main']['temp'].toDouble(),
        feelsLike: json['main']['feels_like'],
        humidity: json['humidity'],
        description: json['description'],
        main: json['main'],
        icon: json['icon'],
        windSpeed: json['windSpeed'],
        country: json['country']
    );
  } 
}
