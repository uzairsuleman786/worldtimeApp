import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //------------set background image--------------------
    String bgimage = data['isDaytime']
        ? 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-33/world_time_app/assets/day.png'
        : 'https://raw.githubusercontent.com/iamshaunjp/flutter-beginners-tutorial/lesson-33/world_time_app/assets/night.png';
    Color bgcolor = data['isDaytime'] ? Colors.blue : Colors.indigo[800];

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('$bgimage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data ={
                        'time' : result['time'],
                        'location' : result['location'],
                        'isDaytime' : result['isDaytime'],
                        'flag' : result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Choose Location',
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                          letterSpacing: 2, fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['time'],
                      style: TextStyle(fontSize: 65, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
