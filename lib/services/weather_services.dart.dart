import 'dart:convert';
import 'dart:developer';

import 'package:atmos_api/model/weather_model.dart';
import 'package:atmos_api/secrets/api.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  Future<WeatherModel?> getWeatherData(String cityName, context) async {
    try {
      final String baseUrl =
          "${APIendPoints().cityUrl}$cityName&appid=${APIendPoints().apiKey}${APIendPoints().unit}";
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return WeatherModel.fromJson(data);
      } else {
        log('Error:${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Exception:$e');
      return null;
    }
  }
}
