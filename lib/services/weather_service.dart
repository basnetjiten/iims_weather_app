import 'dart:convert';

import 'package:weather_app/models/weather_forecast_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static Future<WeatherModel> fetchWeatherData({required String userQuery}) async {

    print("api ${'https://api.weatherapi.com/v1/current.json?key=65927f419f684af689f75213231106&q=$userQuery&aqi=no'}");
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=65927f419f684af689f75213231106&q=$userQuery&aqi=no'));
    final Map<String, dynamic> actualResponseMap =
        jsonDecode(response.body) as Map<String, dynamic>;

    final WeatherModel weatherModel = WeatherModel.fromJson(actualResponseMap);

    return weatherModel;
  }

  static Future<WeatherForecastModel> fetchForecastWeatherData() async {
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/forecast.json?key=65927f419f684af689f75213231106&q=Kathmandu&days=1&aqi=no&alerts=no'));
    final Map<String, dynamic> actualResponseMap =
        jsonDecode(response.body) as Map<String, dynamic>;

    final WeatherForecastModel weatherForecastModel =
        WeatherForecastModel.fromJson(actualResponseMap);

    return weatherForecastModel;
  }
}

abstract class WeatherRepo {
  Future<WeatherModel> fetchWeatherData({String placeName});

  Future<WeatherModel> fetchWindData();
}
