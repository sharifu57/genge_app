import 'package:get/get.dart';

class ProductController extends GetxController {
  late final String categoryRowId;
  @override
  void onInit() {
    super.onInit();
    categoryRowId = Get.arguments?["rowId"] ?? "";
  }
}
