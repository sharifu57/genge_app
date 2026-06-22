import 'package:flutter/cupertino.dart';
import 'package:genge_app/features/orders/order_controller.dart';
import 'package:get/state_manager.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("ORDERS"));
  }
}
