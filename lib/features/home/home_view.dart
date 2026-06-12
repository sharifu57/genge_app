
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genge_app/core/widgets/home_app_bar.dart';
import 'package:genge_app/features/home/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: HomeAppBar(),
      body: Center(
        child: Text("Center"),
      ),
    );
  }

}