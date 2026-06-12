

import 'package:genge_app/features/wrapper/wrapper_controller.dart';
import 'package:get/get.dart';

class WrapperBinding  extends Bindings{
  @override
  void dependencies() {
    Get.put(WrapperController());
  }
}