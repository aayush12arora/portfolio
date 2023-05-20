import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:portfolio/Controllers/second%20controler.dart';
import 'package:portfolio/Pages/HomePage.dart';
import 'package:portfolio/Pages/mobile_devices_pages/Mob_HomePage.dart';
class Thanks extends StatefulWidget {
  int flag=0;
 Thanks(int flag ){
   this.flag = flag;
 }

  @override
  State<Thanks> createState() => _ThanksState();
}

class _ThanksState extends State<Thanks> {
SecondControler secondControler = Get.put(SecondControler());
  @override
  Widget build(BuildContext context) {
    secondControler.helper();
    Future.delayed(Duration(seconds: 5), () {
      if(widget.flag==0){
        Get.to(HomePage());
      }else{
        Get.to(MobHomePage());
      }

    });
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(child: Center(
      child: GetBuilder<SecondControler>(
        builder: (co){
          String x = secondControler.sec.toString();
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Thanks I will get in touch with you very soon",style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.w600)),
              SizedBox(height: screenSize.height*0.15,),
              Text("You will be automatically taken back to home screen after $x seconds",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w300)),
            ],
          );
        },

      ),
    ));
  }
}

