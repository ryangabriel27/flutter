import 'package:projeto_tempo_api/Model/weatherModel.dart';
import 'package:projeto_tempo_api/Service/weather_service.dart';

class WeatherController {
  List<Weather> listWeather = [];
  WeatherService _service = new WeatherService();

  // Métodos
  Future<void> getFromWeatherServiceCity(String city) async {
    Weather newWheater = Weather.fromJson(await _service.getWeather(city));
    listWeather.add(newWheater);
  }

  Future<void> getFromWeatherServiceLocation(double lat, double lon) async {
    listWeather.clear();
    Weather newWheater =
        Weather.fromJson(await _service.getWeatherByLocation(lat, lon));
    listWeather.add(newWheater);
  }
}
