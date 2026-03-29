import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Weather {
  final String cityName;
  final String temperature;
  final String feelsLike;
  final int humidity;
  final String description;
  final String main;
  final String icon;
  final double windSpeed;
  final String country;

  Weather({
    required this.cityName,
    required this.temperature,
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
    temperature: json['main']['temp'].toDouble(),
    feelsLike: json['main']['feels_like'].toDouble(),
    humidity: json['main']['humidity'],
    description: json['weather'][0]['description'],
    main: json['weather'][0]['main'],   
    icon: json['weather'][0]['icon'],  
    windSpeed: json['wind']['speed'].toDouble(),
    country: json['sys']['country'],
  );
}
}

Future<Weather> fetchWeather() async {
  final weatherData = await http.get(Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=London&appid=755481f6cc2d8cc1b46fd328278b7dc6"));

  if (weatherData.statusCode == 200) {
    final data = jsonDecode(weatherData.body);
    return Weather.fromJson(data);
  } else {
    throw Exception("Unknown error");
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
      ),
      body: FutureBuilder<Weather>(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: const CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("Error ${snapshot.error}"),
            );
          }

          final weathers = snapshot.data!;

          return ListView.builder(
            itemCount: weathers.length,
            itemBuilder: (context, index) {
              final weather = weathers[index];

              return  ListTile(
                title: Text(weather.cityName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text("Temperature ${weather.temperature}"),
                     Text("Feels Like ${weather.feelsLike}"),
                     Text("Humidity ${weather.humidity}"),
                     Text("Condition ${weather.main}"),
                     Text("Description ${weather.description}"),
                     Text("Wind speed ${weather.windSpeed}"),
                     Text("Country ${weather.country}")
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}