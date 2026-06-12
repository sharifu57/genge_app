

import 'package:get/get.dart';

import '../../core/services/location_service.dart';

class HomeController extends GetxController {
  final locationName = "Loading...".obs;
  final isLoadingLocation = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchLocation();
  }

  Future<void> fetchLocation() async {
    isLoadingLocation.value = true;

    final position =
    await LocationService.getCurrentPosition();

    if (position == null) {
      locationName.value = "Location not available";
      isLoadingLocation.value = false;
      return;
    }

    final address =
    await LocationService.getAddressFromLatLng(
      position.latitude,
      position.longitude,
    );

    locationName.value = address;
    isLoadingLocation.value = false;
  }
}