import 'package:atmos_api/controller/location_provider.dart';
import 'package:atmos_api/controller/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  Reload(context) {
    final locatingProvider =
        Provider.of<LocationProvider>(context, listen: false);
    locatingProvider.getCurrentPosition().then((value) {
      if (locatingProvider.currentLocationName != null) {
        dynamic cityName = locatingProvider.currentLocationName?.locality;
        Provider.of<WeatherProvider>(context, listen: false)
            .getWeatherData(cityName, context);
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Reloading..."), duration: Duration(seconds: 1)));
  }
}
