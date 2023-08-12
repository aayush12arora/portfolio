import 'dart:collection';
import 'dart:developer';

import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/Pages/About.dart';
import 'package:portfolio/Pages/Education.dart';
import 'package:portfolio/Pages/Projects.dart';
import 'package:portfolio/Pages/Skills.dart';
//import 'package:portfolio/Pages/hire_mepage.dart';
import 'package:portfolio/Pages/mobile_devices_pages/widgets/MobAppBarr.dart';
//import 'package:portfolio/Pages/mobile_devices_pages/MobEducation.dart';
import 'package:portfolio/Pages/mobile_devices_pages/widgets/mobfloatingwidget.dart';
import 'package:portfolio/Widgets/AppBar.dart';
import 'package:portfolio/Widgets/floatingwidget.dart';
import 'package:portfolio/providers/Navprovider.dart';

import '../../Widgets/Menu_drawer.dart';
import '../../Widgets/footer.dart';

import 'MobAbout.dart';
import 'MobEducation.dart';
import 'MobProjects.dart';
import 'MobSkills.dart';

class MobHomePage extends StatefulWidget {
  const MobHomePage({Key? key}) : super(key: key);

  @override
  State<MobHomePage> createState() => _MobHomePageState();
}

class _MobHomePageState extends State<MobHomePage>
    with TickerProviderStateMixin {
  late Animation<Offset> slideanimation;
  late AnimationController slideanimationcontroller;
  final ScrollController _scrollController = ScrollController();
  List dropdownItemList = [
    {'label': 'About', 'value': 'About'}, // label is required and unique
    {'label': 'Skills', 'value': 'Skills'},
    {'label': 'Education', 'value': 'Education'},
    {'label': 'Projects', 'value': 'Projects'},
  ];
  String dropdownValue = 'Menu';
  Map<String, dynamic> Selectedperson = new HashMap();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
    slideanimationcontroller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    slideanimation = Tween(
      begin: Offset(-2, -5),
      end: Offset(0, 0),
    ).animate(slideanimationcontroller.view);

    slideanimationcontroller.forward();
    slideanimationcontroller.reverse();
    slideanimationcontroller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    print('screen height ${screenSize.height}');
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(screenSize.width, 70),
            child: MobAppBarr(
              scrollController: _scrollController,
              scrsize: screenSize,
            )),
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: SizedBox(
                      height: screenSize.height ,
                      width: screenSize.width,
                      child: Image.asset(
                        'assets/background.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SlideTransition(
                      position: slideanimation,
                      child: MobFloatingQuickAccessBar(screenSize: screenSize)),
                ],
              ),
              MobAbout(),
              MobSkills(),
              MobEducation(),
              MobProjects(),
              BottomBar(),
            ],
          ),
        ));
  }
}
