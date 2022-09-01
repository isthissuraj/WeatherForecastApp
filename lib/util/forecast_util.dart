import 'package:intl/intl.dart';

class Util{

  static String appId ="d7a8b963189940aece6e430522eff864";
  static String getFormattedDate(DateTime dateTime){
    return DateFormat('EEEE, MMM d, y' ).format(dateTime); // all dates and year as 2002
  }

}