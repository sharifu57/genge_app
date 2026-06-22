import 'package:flutter/material.dart';
import 'package:genge_app/features/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("PROFILE"));
  }
}
