

import 'package:get/get.dart';

class WrapperController extends GetxController {

  final selectedIndex = 0.obs;
  final cartCount = 3.obs;

  void changeTab(int index){
    selectedIndex.value=index;
  }
}