import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:projeto_tempo_api/Controller/weatherController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherController _controller = new WeatherController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getWeather();
  }

  Future<void> _getWeather() async {
    try {
      //GeoLocator
      Position position = await Geolocator.getCurrentPosition();
      _controller.getFromWeatherServiceLocation(
          position.latitude, position.longitude);
      print(position.latitude);
      print(position.longitude);
    } catch (e) {
      print(e);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página inicial"),
        leading: Icon(Icons.search),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/search");
                    },
                    child: Text("Search")),
                ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, "/favorites");
                }, child: Text("Favorite")),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            _controller.listWeather.isEmpty
                ? IconButton(
                    onPressed: () {
                      _getWeather();
                    },
                    icon: Icon(Icons.refresh))
                : Column(children: [
                    Text(_controller.listWeather.last.city),
                    Text(_controller.listWeather.last.description),
                    Text("${(_controller.listWeather.last.temp - 273)}"),
                    Text("${_controller.listWeather.last.tempMin - 273}"),
                    Text("${_controller.listWeather.last.tempMax - 273}"),
                    IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        _getWeather();
                      },
                    )
                  ])
          ],
        ),
      ),
    );
  }
}
