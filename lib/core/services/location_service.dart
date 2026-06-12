

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {

  static Future<bool> requestPermission() async {

    bool serviceEnabled;
    LocationPermission permission;

    // 1. Check if GPS is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return false; // GPS OFF
    }

    // 2. Check permission status
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return false; // permanently denied
    }

    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  static Future<Position?> getCurrentPosition() async {
    bool allowed = await requestPermission();

    if (!allowed) return null;

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  /// Convert lat/lng → readable address
  static Future<String> getAddressFromLatLng(
      double lat,
      double lng,
      ) async {
    try {
      List<Placemark> places =
      await placemarkFromCoordinates(lat, lng);

      Placemark place = places.first;

      return "${place.locality}, ${place.subAdministrativeArea}";
    } catch (e) {
      return "Unknown location";
    }
  }
}