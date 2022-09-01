import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart';

import '../model/weather_forecast_model.dart';
import '../util/forecast_util.dart';

class Network {
   Future<WeatherForecastModel> getWeatherForecast({required String cityName}) async {
  var finalUrl="http://api.openweathermap.org/data/2.5/forecast?q="+cityName+
      "&appid=" +Util.appId+ "&units=metric";
  
  final response = await get(Uri.parse(finalUrl));
  print("URL : ${Uri.encodeFull(finalUrl)}");

  if (response.statusCode == 200){
    //here we get the actual mapped model (dart object )
    print(("weather data: ${response.body}"));
  return WeatherForecastModel.fromJson(json.decode(response.body));
     }else{
    throw Exception("Error getting weather forecast");
     }

  }
}