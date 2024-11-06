import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationWorking {
  Future<Placemark?> getCurrentLocation(Position? position) async {
    if (position != null) {
      try {
        final placemark = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        if (placemark.isNotEmpty) {
          return placemark[0];
        }
      } catch (e) {
        print("Error fetching Location name: $e");
      }
    }
    return null;
  }
}
