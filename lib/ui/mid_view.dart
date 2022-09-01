import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/weather_forecast_model.dart';
import '../util/convert_icon.dart';
import '../util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel>snapshot){
  var forecastList = snapshot.data?.list;

  var city = snapshot.data?.city?.name;
  var country = snapshot.data?.city?.country;
  var formattedDate = DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${city}, ${country}", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black
          ),),
          Text("${Util.getFormattedDate(formattedDate)}", style: TextStyle(
            fontSize: 15,
          ),),
          
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(weatherDescription: forecastList[0].weather![0].main,
                color: Colors.blue, size: 128),
          ),
          //Icon(FontAwesomeIcons.cloud, size :195, color: Colors.blue,),
          // Icon(Icons.wb_sunny, size: 150, color: Colors.yellow,),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${forecastList[0].main?.temp?.toStringAsFixed(0)}°C",
                  style: TextStyle(
                  fontSize: 32,
                ),),
                Text("${forecastList[0].weather?[0].description?.toUpperCase()}"),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment : MainAxisAlignment.center,
                    children: [
                      Text("${forecastList[0].wind?.speed?.toStringAsFixed(1)} Km/h"),
                      Icon(FontAwesomeIcons.wind, size: 20, color: Colors.black,)
                      //Icon(FontAwesomeIcons.temperatureHigh, size: 20)
                      // Icon(Icons.arrow_forward, size: 20, color: Colors.brown,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecastList[0].main?.humidity?.toStringAsFixed(0)} %"),
                      Icon(FontAwesomeIcons.solidFaceGrinBeamSweat, size: 20, color: Colors.black,)
                      //Icon(Icons.hot_tub, size: 20, color: Colors.black,)
                    ],
                  ),
                ),
                
                Padding(padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecastList[0].main?.tempMax?.toStringAsFixed(0)}°C "),
                      Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.black,)
                      //Icon(Icons.wb_sunny, size: 20, color: Colors.yellow,)
                    ],
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    ),
  );
  return midView;

}