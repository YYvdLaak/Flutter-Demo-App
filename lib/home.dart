import 'package:flutter/material.dart';
import 'api.dart';

class HomePageState extends State<HomePage> {
  Future<WeatherResponse> weatherData;

  @override 
  void initState() {
    super.initState();
    weatherData = getWeather();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo App')
      ),
      body: Container(
        child: FutureBuilder(
          future: weatherData,
          builder: (BuildContext context, snapshot) {
            if(snapshot.hasData) {
              return Card(
                margin: EdgeInsets.all(16),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Weather in Amsterdam:', 
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.w700
                        )
                      ),
                      Text(snapshot.data.weather[0]['main']),
                      Text('Temperature: ${snapshot.data.temperature}K')
                    ],
                  )
                )
              );
            } else if(snapshot.hasError) {
              return Text('Loading has failed');
            } else {
              return CircularProgressIndicator();
            }
          }
        )
      )
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}