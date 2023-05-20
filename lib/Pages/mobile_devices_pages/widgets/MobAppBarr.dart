import 'dart:collection';
import 'dart:developer';

import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:portfolio/Pages/HomePage.dart';
import 'package:portfolio/providers/Navprovider.dart';

import '../Mob_HomePage.dart';


class MobAppBarr extends StatefulWidget {

  final ScrollController scrollController;
  var scrsize;
  MobAppBarr({required this.scrollController,@required this.scrsize}) ;

  @override
  State<MobAppBarr> createState() => _MobAppBarrState();
}

class _MobAppBarrState extends State<MobAppBarr> {

  List dropdownItemList = [

    {'label': 'About', 'value': 'About'}, // label is required and unique
    {'label': 'Skills', 'value': 'Skills'},
    {'label': 'Education', 'value': 'Education'},
    {'label': 'Projects', 'value': 'Projects'},

  ];
  String dropdownValue = 'Menu';
  Map<String,dynamic> Selectedperson = new HashMap();

  final List _isHovering =[false,false,false,false,false,false,false,];
  final List _onpage =[false,false,false,false,false,false,false,];
  @override
  void initState() {
    NavController controller = Get.put(NavController());
    // TODO: implement initState
    widget.scrollController.addListener(() {
      if(widget.scrollController.offset<widget.scrsize*0.9){
        //controller.alf();
      }
      if(widget.scrollController.offset>=widget.scrsize*0.9&&widget.scrollController.offset<widget.scrsize*2){


        controller.change(0);
      }
      if(widget.scrollController.offset>=widget.scrsize*2&&widget.scrollController.offset<widget.scrsize*3){

        controller.change(1);
      }

      if(widget.scrollController.offset>=widget.scrsize*3&&widget.scrollController.offset<widget.scrsize*4){

        controller.change(2);
      }
      if(widget.scrollController.offset>=widget.scrsize*4){

        controller.change(3);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Material(
      elevation: 7,
      child: Container(

        color: Colors.white.withOpacity(0.5),
        child:  Padding(
          padding: const EdgeInsets.only(left: 14,right:5,top: 14,bottom: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width/17,
              ),
              InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MobHomePage()));

                  },
                  child: Text('Aayush Arora',style: TextStyle(color: Colors.black87,fontSize: 19,fontFamily: 'Raleway',fontWeight: FontWeight.w900,letterSpacing: 3),)),
              SizedBox(
                width: screenSize.width/8,
              ),
              Expanded(
                child: GetBuilder<NavController>(
                  builder: (con){
                    return CoolDropdown(
                        resultWidth: screenSize.width*0.33,
                        dropdownList: dropdownItemList,

                       resultTS: TextStyle(
                         fontSize: 15,
                         color: Colors.black,
                       )
                      ,
                        onChange: (a) {
                          Selectedperson=a;
                          con.clone();
                          if(Selectedperson['value']=='About'){
                            print('here');
                            widget.scrollController.animateTo(
                              screenSize.height,
                              duration: Duration(milliseconds: 700),
                              curve: Curves.easeInOut,
                            );
                          }
                          if(Selectedperson['value']=='Skills'){
                            print('here');
                            widget.scrollController.animateTo(
                              screenSize.height*2.5,
                              duration: Duration(milliseconds: 700),
                              curve: Curves.easeInOut,
                            );
                          }
                          if(Selectedperson['value']=='Education'){
                            print('here');
                            widget.scrollController.animateTo(
                              screenSize.height*3.9,
                              duration: Duration(milliseconds: 700),
                              curve: Curves.easeInOut,
                            );
                          }
                          if(Selectedperson['value']=='Projects'){
                            print('here');
                            widget.scrollController.animateTo(
                              screenSize.height*6.0,
                              duration: Duration(milliseconds: 700),
                              curve: Curves.easeInOut,
                            );
                          }

                          log(Selectedperson['value']);
                        },
                        defaultValue:con.defaullt,
                      // placeholder: 'insert...',
                    );
                  },

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}