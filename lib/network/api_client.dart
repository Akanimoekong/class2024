import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  static const String _baseUrl = 'api.open-meteo.com';

  Future<Map<String, dynamic>> getWeatherData({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final queryParameters = {
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
        'current': 'temperature_2m,is_day,rain,pressure_msl,surface_pressure',
        'hourly': 'temperature_2m,rain,showers,sunshine_duration',
        'timezone': 'Africa/Cairo',
        'forecast_days': '1',
      };

      final uri = Uri.https(_baseUrl, '/v1/forecast', queryParameters);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching weather data: $e');
    }
  }

  // Helper method to parse the current weather data
  Map<String, dynamic> parseCurrentWeather(Map<String, dynamic> data) {
    final current = data['current'];
    final units = data['current_units'];

    return {
      'temperature': '${current['temperature_2m']}${units['temperature_2m']}',
      'isDay': current['is_day'] == 1,
      'rain': '${current['rain']}${units['rain']}',
      'pressureMsl': '${current['pressure_msl']}${units['pressure_msl']}',
      'surfacePressure': '${current['surface_pressure']}${units['surface_pressure']}',
    };
  }

  // Helper method to parse the hourly forecast
  List<Map<String, dynamic>> parseHourlyForecast(Map<String, dynamic> data) {
    final hourly = data['hourly'];
    final List<String> times = List<String>.from(hourly['time']);
    final List<double> temperatures = List<double>.from(hourly['temperature_2m']);
    final List<double> rain = List<double>.from(hourly['rain']);
    final List<double> showers = List<double>.from(hourly['showers']);
    final List<double> sunshine = List<double>.from(hourly['sunshine_duration']);

    List<Map<String, dynamic>> hourlyForecasts = [];

    for (int i = 0; i < times.length; i++) {
      hourlyForecasts.add({
        'time': times[i],
        'temperature': '${temperatures[i]}${data['hourly_units']['temperature_2m']}',
        'rain': '${rain[i]}${data['hourly_units']['rain']}',
        'showers': '${showers[i]}${data['hourly_units']['showers']}',
        'sunshine': '${sunshine[i]}${data['hourly_units']['sunshine_duration']}',
      });
    }

    return hourlyForecasts;
  }
}

// Example usage
// void main() async {
//
// }