import 'package:get/get.dart';

class Opacitychnge extends GetxController {
  var brightnessValue = 0.0.obs;

  void updateBrightness(double value) {
    brightnessValue.value = value;
  }
}
