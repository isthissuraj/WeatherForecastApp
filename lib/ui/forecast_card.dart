import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/util/convert_icon.dart';

import '../model/weather_forecast_model.dart';
import '../util/forecast_util.dart';

Widget ?forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index){
  var forecastList = snapshot.data?.list;
  var dayOfWeek = "";
  DateTime date =new DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0]; // sat, dec 12, 2022
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )),

      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDescription: forecastList[index].weather![0].main),
          ),
          Column(
            children: [
              Row(
                children: [
                  Text("${forecastList[index].main?.tempMin?.toStringAsFixed(0)} °C"),
                  Icon(FontAwesomeIcons.solidArrowAltCircleDown, color: Colors.blueAccent.shade700, size: 13,)
                ],
              ),
              Row(
                children: [
                  Text("${forecastList[index].main?.tempMax?.toStringAsFixed(0)} °C"),
                  Icon(FontAwesomeIcons.solidArrowAltCircleUp, color: Colors.blueAccent.shade700, size: 13,)
                ],
              ),
              Row(
                children: [
                  Text("Hum: ${forecastList[index].main?.humidity?.toStringAsFixed(0)} %"),
                  Icon(FontAwesomeIcons.solidFaceGrinBeamSweat, color: Colors.blueAccent.shade700, size: 13,)
                ],
              ),
              Row(
                children: [
                  Text("Win: ${forecastList[index].wind?.speed?.toStringAsFixed(0)} Km/h "),
                  Icon(FontAwesomeIcons.wind, color: Colors.blueAccent.shade700, size: 13,)
                ],
              )
            ],
          )
        ],
      ),


    ],
  );
}