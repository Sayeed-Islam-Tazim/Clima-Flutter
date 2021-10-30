import 'package:clima/screens/location_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String apiKey = 'ec7855380f4e316b78633309e9852c86';

  double lat;
  double long;

  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationData();

    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (_) => LocationScreen(
                  locationWeather: weatherData,
                )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
        // child: ElevatedButton(
        //   onPressed: () {
        //     //Get the current location
        //     getLocationData();
        //   },
        //   child: Text('Get Location'),
        // ),
      ),
    );
  }
}
