import 'dart:developer';

import 'package:atmos_api/model/weather_model.dart';
import 'package:atmos_api/services/weather_services.dart.dart';
import 'package:flutter/material.dart';

class WeatherProvider extends ChangeNotifier {
  bool isLoading = false;
  WeatherModel? weatherModel;
  TextEditingController searchController = TextEditingController();
  final WeatherServices weatherServices = WeatherServices();

  Future<WeatherModel?> getWeatherData(String city, context) async {
    isLoading = true;
    notifyListeners();
    try {
      weatherModel = await weatherServices.getWeatherData(city, context);
    } catch (e) {
      log('Exception: $e');

      weatherModel = null;
    } finally {
      isLoading = false;
      notifyListeners();
      return weatherModel;
    }
  }
}
