

import 'package:flutter/material.dart';
import 'package:genge_app/features/auth/signIn/signin_controller.dart';
import 'package:get/get.dart';

class SignInView extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Sign In View"),
        ),
      ),
    );
  }
}