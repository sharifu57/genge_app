import 'package:flutter/material.dart';
import 'package:genge_app/core/storage/secure_storage.dart';
import 'package:genge_app/data/models/category_model.dart';
import 'package:genge_app/data/repositories/category/category_repository.dart';
import 'package:get/get.dart';

import '../../core/services/location_service.dart';

class HomeController extends GetxController {
  final locationName = "Loading...".obs;
  final isLoadingLocation = false.obs;
  final searchController = TextEditingController();

  final fullName = "".obs;

  final CategoryRepository _categoryRepository = CategoryRepository();
  final categories = <CategoryModel>[].obs;
  final isLoadingCategories = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLocation();
    loadUserData();
    loadCategories();
  }

  Future<void> loadUserData() async {
    final name = await SecureStorage.getUserFullName();
    // final accessToken = await SecureStorage.getAccessToken();

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

  Future<void> loadCategories() async {
    try {
      isLoadingCategories.value = true;
      final result = await _categoryRepository.getCategories();
      categories.assignAll(result);
    } finally {
      isLoadingCategories.value = false;
    }
  }
}
