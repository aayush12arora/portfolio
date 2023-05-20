import 'dart:async';

import 'package:get/get.dart';

class SecondControler extends GetxController{
int s = 5;

int get sec=>s;
void helper() {
  //int initialValue = 10;
  countdown();
}
void countdown() {
  Timer.periodic(Duration(seconds: 1), (Timer timer) {
    if (s> 0) {

      s--;
      update();
    } else {
      timer.cancel();
      print('Countdown complete!');
    }
  });
}







}