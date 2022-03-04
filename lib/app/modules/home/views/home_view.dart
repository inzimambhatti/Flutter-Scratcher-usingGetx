import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:scratcher/scratcher.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Scratcher(
              key: controller.scratchKey,
              child: Container(
                height: 300,
                width: 300,
                child: Image(
                  image: AssetImage("image/logo.jpg"),
                ),
              ),
              brushSize: 10,
              threshold: 50,
              color: Colors.lightBlue,
              onChange: (value) {
                controller.scratchProgress.value = value;
              },
              onThreshold: () {
                controller.isThresholdReached.value = true;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => Text(
                'Scratch Progress: ' +
                    controller.scratchProgress.value.toStringAsFixed(2),
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => controller.isThresholdReached.value
                  ? Text(
                      'Threshold Reached',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    )
                  : Text('Threshold not reached'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.scratchKey.currentState
                      ?.reset(duration: Duration(milliseconds: 2000));
                  controller.isThresholdReached.value = false;
                },
                child: Text('Reset'))
          ],
        ),
      ),
    );
  }
}
