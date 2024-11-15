import 'dart:developer';

import 'package:class2024/network/models/baseresponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {

  Future<BaseResponse> getWeatherData({
    required String authorName,
    required String apiKey,
  }) async {
    try {
      final uri = Uri.parse('https://api.nytimes.com/svc/books/v3/reviews.json?author=$authorName &api-key= $apiKey');

      final response = await http.get(uri);
      if (response.statusCode == 200) {
        BaseResponse mResponse = BaseResponse.fromJson(jsonDecode(response.body));

        return mResponse;
        // return json.decode(response.body);
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching weather data: $e');
    }
  }


}

// Example usage
// void main() async {
//
// }