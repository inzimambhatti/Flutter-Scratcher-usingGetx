import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scratcher/scratcher.dart';

class HomeController extends GetxController {
  var scratchProgress = 0.0.obs;
  var isThresholdReached = false.obs;
  final scratchKey = GlobalKey<ScratcherState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
