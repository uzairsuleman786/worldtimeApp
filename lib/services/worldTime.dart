import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldtime{
  String location; // location name in the UI
  String time; // time of that location
  String flag; //flag of that location
  String url; //url of the location
  bool isDaytime;


  worldtime({this.location,this.flag, this.url});

  Future<void> getTime() async {
    try {
      //-----------------------Make Request----------------
      Response response = await get(
          "http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      //print(data);

      //---------------get property from data------------
      String date = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(date);

      //-------------convert datetime object--------------
      DateTime dateTime = DateTime.parse(date);
      dateTime = dateTime.add(Duration(hours: int.parse(offset)));

      // set time into string
      isDaytime = dateTime.hour > 6 && dateTime.hour < 20 ? true : false;
      time = DateFormat.jm().format(dateTime);
    }
    catch(e){
      print('Caught Error: $e');
      time= 'There is an Error Finding Location';
    }
  }
}