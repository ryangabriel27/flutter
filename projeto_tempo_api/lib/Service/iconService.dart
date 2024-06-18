import 'package:flutter/material.dart';

class IconService {
  static IconData getWeatherIcon(String description) {
    switch (description.toLowerCase()) {
      case 'clear sky':
        return Icons.wb_sunny;
      case 'few clouds':
        return Icons.wb_cloudy;
      case 'scattered clouds':
        return Icons.cloud;
      case 'broken clouds':
        return Icons.cloud_queue;
      case 'shower rain':
        return Icons.grain;
      case 'rain':
        return Icons.beach_access;
      case 'thunderstorm':
        return Icons.flash_on;
      case 'snow':
        return Icons.ac_unit;
      case 'mist':
        return Icons.blur_on;
      default:
        return Icons.cloud; // Ícone padrão
    }
  }
}
