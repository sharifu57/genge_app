import 'package:flutter/material.dart';
import 'package:genge_app/core/storage/secure_storage.dart';
import 'package:get/get.dart';

import '../../core/services/location_service.dart';

class HomeController extends GetxController {
  final locationName = "Loading...".obs;
  final isLoadingLocation = false.obs;
  final searchController = TextEditingController();

  final fullName = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchLocation();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final name = await SecureStorage.getUserFullName();

    print("Stored name: $name");

    if (name != null) {
      fullName.value = name;
    }
  }

  Future<void> fetchLocation() async {
    isLoadingLocation.value = true;

    final position = await LocationService.getCurrentPosition();

    if (position == null) {
      locationName.value = "Location not available";
      isLoadingLocation.value = false;
      return;
    }

    final address = await LocationService.getAddressFromLatLng(
      position.latitude,
      position.longitude,
    );

    locationName.value = address;
    isLoadingLocation.value = false;
  }
}
