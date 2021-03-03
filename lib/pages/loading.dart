import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {

  //---------------------Asyncronous Code----------------------
  // void getData() async{
  //   String country1 = await Future.delayed(Duration(seconds: 3), (){
  //     return "Pakistan!";
  //   });
  //   String country2 = await Future.delayed(Duration(seconds: 2), (){
  //     return "India";
  //   });
  //
  //   print("Bangladesh");
  //   print('$country1 - $country2');
  // }

  //--------------------Packages-----------------------
  // void getData() async{
  //   Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
  //   Map data = jsonDecode(response.body);
  //   print(data);
  //   print(data ['title']);
  // }

 // String time = 'loading';

  void setupWorldTime() async{
    worldtime instance = worldtime(location: 'London', flag: 'germany.png', url: 'Europe/London');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,
    });
    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    //print("Kashmir");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        //padding: EdgeInsets.all(50),
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),                      //time
      ),
    );
  }
}
