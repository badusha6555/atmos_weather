import 'package:atmos_api/controller/weather_provider.dart';
import 'package:atmos_api/services/location_working.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;

  final LocationWorking locationWorking = LocationWorking();
  final WeatherProvider weatherProvider = WeatherProvider();

  Placemark? _currentLocationName;
  Placemark? get currentLocationName => _currentLocationName;

  Future<void> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      _currentPosition = null;
      notifyListeners();
      return;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _currentPosition = null;
        notifyListeners();
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      _currentPosition = null;
      notifyListeners();
      return;
    }

    _currentPosition = await Geolocator.getCurrentPosition();
    notifyListeners();
    // print(_currentPosition);

    _currentLocationName =
        await locationWorking.getCurrentLocation(_currentPosition!);
    print(_currentLocationName);

    notifyListeners();
  }

  Future<void> getWeatherData(BuildContext context) async {
    await weatherProvider.getWeatherData(searchController.text, context);
    searchController.clear();
    notifyListeners();
  }
}
