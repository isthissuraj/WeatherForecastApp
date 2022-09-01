import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weatherapp/ui/bottom_view.dart';
import 'package:weatherapp/ui/mid_view.dart';

import '../model/weather_forecast_model.dart';
import '../network/network.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "Mumbai";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather(cityName: _cityName);

    // forecastObject.then((weather){
    //        print(weather.list[0].weather[0].main);
    // });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Forecast"),
        backgroundColor: Colors.blue,
      ),
     body: ListView(
       children: [
         textFieldView(),
         Container(
           child: FutureBuilder<WeatherForecastModel>(
             future: forecastObject,
             builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot){
               if (snapshot.hasData){
                 return Column(
                   children: [
                     midView(snapshot),
                     bottomView(snapshot, context)
                   ],
                 );
               }else {
                 return Container(
                   child: Center(child: CircularProgressIndicator(),),
                 );
               }

             }
           ),
         )
       ],
     ),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 9, right: 9),
      child: Container(
        child: TextField(
          decoration: InputDecoration(

            hintText: "Enter City Name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            contentPadding: EdgeInsets.all(8)
          ),
          onSubmitted: (value){
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);
            });

          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({required String cityName}) =>
      new Network().getWeatherForecast(cityName: _cityName);
}
