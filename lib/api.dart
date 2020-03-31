import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<WeatherResponse> getWeather() async {
  final String _apiKey = 'YOUR_API_KEY_HERE';
  final String _city = 'Amsterdam';

  String _url = 'https://api.openweathermap.org/data/2.5/weather?q=$_city&appid=$_apiKey';
  var _response = await http.get(_url);
  if(_response.statusCode >= 200 && _response.statusCode < 300){
    return WeatherResponse.fromJson(json.decode(_response.body));
  } else {
    throw Exception('API Call Failed!');
  }
}

class WeatherResponse {
  final dynamic weather;
  final dynamic temperature;

  WeatherResponse({this.weather, this.temperature});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      weather: json['weather'],
      temperature: json['main']['temp']
    );
  }
}