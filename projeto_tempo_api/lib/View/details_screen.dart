import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_tempo_api/Controller/city_db_controller.dart';
import 'package:projeto_tempo_api/Controller/weatherController.dart';
import 'package:projeto_tempo_api/Model/city_db_model.dart';

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
  bool isFavorited = false;
  final _cityDbController = CityDbController();
  late CityDb? newCity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _identificaCidade();
  }

  Future<void> _identificaCidade() async {
    newCity = await _cityDbController.getCity(city);

    if (newCity!.isFavorite == 0) {
      isFavorited = false;
    } else if (newCity!.isFavorite == 1) {
      isFavorited = true;
    } else {
      isFavorited = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.city)),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: FutureBuilder(
            future: _controller.getFromWeatherServiceCity(city),
            builder: (context, snapshot) {
              if (_controller.listWeather.isEmpty) {
                return CircularProgressIndicator();
              } else {
                return Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_controller.listWeather.last.city),
                      //favorite icon
                      IconButton(
                        icon: isFavorited
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_border_outlined),
                        onPressed: () async {
                          setState(() {
                            isFavorited = !isFavorited;
                          });
                          if (isFavorited) {
                            newCity = await _cityDbController.getCity(city);
                            newCity!.isFavorite = 1;
                            _cityDbController.update(newCity!);
                          } else {
                            newCity = await _cityDbController.getCity(city);
                            newCity!.isFavorite = 0;
                            _cityDbController.update(newCity!);
                          }
                          //criar a função para favoritar
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Column(children: [
                    Text(_controller.listWeather.last.city),
                    Text(_controller.listWeather.last.description),
                    Text(
                        "${(_controller.listWeather.last.temp - 273).toStringAsFixed(2)} C°"),
                    Text(
                        "${(_controller.listWeather.last.tempMin - 273).toStringAsFixed(2)} C°"),
                    Text(
                        "${(_controller.listWeather.last.tempMax - 273).toStringAsFixed(2)} C°"),
                    IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () {},
                    )
                  ])
                ]);
              }
            },
          ),
        ),
      ),
    );
    ;
  }
}
