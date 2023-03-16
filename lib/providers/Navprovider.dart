import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NavController extends GetxController{


   List _isHovering =[false,false,false,false,];
   List _onpage =[false,false,false,false,];
List get fio=>_isHovering;
   List get fit=>_onpage;
void change(int k){
  for(int i =0;i<_isHovering.length;i++){
     if(i==k){
        _isHovering[i]=true;
        _onpage[i]=true;
        update();
     }
     else{
        _isHovering[i]=false;
        _onpage[i]=false;
        update();
     }
  }
}


void hover(int k,bool val){
   // check if button is not active

         _isHovering[k] = val; // set hover state to current hover value

   update();

}
}

