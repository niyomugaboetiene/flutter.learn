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
        feelsLike: json['main']['feels_like'].toDouble(),
        humidity: json['main']['humidity'],
        description: json['weather'][0]['description'],
        main: json['main'][0]['main'],
        icon: json['main'][0]['icon'],
        windSpeed: json['wind']['speed'].toDouble(),
        country: json['sys']['country']
    );
  } 
}
