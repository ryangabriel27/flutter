import 'package:flutter/material.dart';
import 'package:projeto_tempo_api/Controller/city_db_controller.dart';
import 'package:projeto_tempo_api/Controller/weatherController.dart';
import 'package:projeto_tempo_api/Model/city_db_model.dart';
import 'package:projeto_tempo_api/View/details_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final TextEditingController _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _controller = new WeatherController();
  final _cityDbController = new CityDbController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: _cityDbController.getFavoriteCities(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (_cityDbController.getCities().isEmpty) {
                      return Center(
                        child: Text(
                          'Não há cidades favoritas',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: _cityDbController.getCities().length,
                        itemBuilder: (context, index) {
                          final reversedIndex =
                              _cityDbController.getCities().length - index - 1;
                          return ListTile(
                            title: Text(_cityDbController
                                .getCities()[reversedIndex]
                                .cityName),
                            onTap: () {
                              _findCity(_cityDbController
                                  .getCities()[reversedIndex]
                                  .cityName);
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _findCity(String city) async {
    if (await _controller.findCity(city)) {
      CityDb cityDb = CityDb(cityName: city, isFavorite: 0);
      _cityDbController.create(cityDb);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Cidade encontrada!!"),
          duration: Duration(seconds: 2),
        ),
      );

      // Redireciona
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsScreen(
            city: _cityController.text,
          ),
        ),
      );
      setState(() {
        _cityDbController.getCities().clear();
      });
    } else {
      _cityController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Cidade não encontrada"),
        ),
      );
      setState(() {});
    }
  }
}
