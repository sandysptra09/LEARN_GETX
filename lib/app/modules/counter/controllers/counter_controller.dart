import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  final count = 0.obs;

  void increment() {
    count.value++;
    if (count > 20) {
      Get.snackbar("Overflow", "Brooo counter has been overflow",
          colorText: Colors.white,
          backgroundColor: Colors.green,
          icon: const Icon(Icons.add_alert));
      count.value--;
    }
  }

  void decrement() {
    count.value--;
    if (count < 0) {
      Get.snackbar("Alert", "Counter must at least 1 value",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.crisis_alert));
    }
  }
}
