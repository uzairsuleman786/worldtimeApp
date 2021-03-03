import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/worldTime.dart';

class chooseLocation extends StatefulWidget {
  @override
  _chooseLocationState createState() => _chooseLocationState();
}

class _chooseLocationState extends State<chooseLocation> {

  @override
  Widget build(BuildContext context) {

    List<worldtime> locations = [
      worldtime(url: 'Europe/London', location: 'London', flag: 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/uk.png'),
      worldtime(url: 'Europe/Berlin', location: 'Athens', flag: 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/egypt.png'),
      worldtime(url: 'Africa/Cairo', location: 'Cairo', flag: 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/germany.png'),
      worldtime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/kenya.png'),
      worldtime(url: 'America/Chicago', location: 'Chicago', flag: 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/usa.png'),
      worldtime(url: 'America/New_York', location: 'New York', flag: 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/usa.png'),
      worldtime(url: 'Asia/Seoul', location: 'Seoul', flag: 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/south_korea.png'),
      worldtime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-34/world_time_app/assets/indonesia.png'),
    ];

    void updateTime(index) async {
      worldtime instance = locations[index];
      await instance.getTime();
      //Navigate home screen
      Navigator.pop(context,{
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime' : instance.isDaytime,
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey[150],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,             //Shadow Remove
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                   // print(locations[index].location);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('${locations[index].flag}') ),
                  ),
                ),
              );
          },
      ),
     // body: SafeArea(child: Text('Choose Location')),
    );
  }
}
