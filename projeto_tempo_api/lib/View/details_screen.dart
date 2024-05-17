import 'package:flutter/material.dart';
import 'package:projeto_tempo_api/Controller/weatherController.dart';

class DetailsScreen extends StatefulWidget {
  String city;
  DetailsScreen({required this.city});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState(city: city);
}

class _DetailsScreenState extends State<DetailsScreen> {
  String city;
  _DetailsScreenState({required this.city});

  WeatherController _controller = new WeatherController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getFromWeatherServiceCity(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
        leading: Icon(Icons.search),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 5.0,
            ),
            _controller.listWeather.isEmpty
                ? IconButton(
                    onPressed: () {
                      
                    },
                    icon: Icon(Icons.refresh))
                : Column(children: [
                    Text(_controller.listWeather.last.city),
                    Text(_controller.listWeather.last.description),
                    Text("${_controller.listWeather.last.temp - 273}"),
                    Text("${_controller.listWeather.last.tempMin - 273}"),
                    Text("${_controller.listWeather.last.tempMax - 273}"),
                    IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {
                        
                      },
                    )
                  ])
          ],
        ),
      ),
    );;
  }
}
