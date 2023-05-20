import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/Pages/About.dart';
import 'package:portfolio/Pages/Education.dart';
import 'package:portfolio/Pages/Projects.dart';
import 'package:portfolio/Pages/Skills.dart';

import 'package:portfolio/Widgets/AppBar.dart';
import 'package:portfolio/Widgets/floatingwidget.dart';
import 'package:portfolio/providers/Navprovider.dart';

import '../Widgets/Menu_drawer.dart';
import '../Widgets/abtappbar.dart';
import '../Widgets/footer.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  FirebaseFirestore instan = FirebaseFirestore.instance;
  late  Animation<Offset> slideanimation;
  late AnimationController slideanimationcontroller;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {

    super.initState();
_scrollController.addListener(() { 
  print(_scrollController.offset);
});
    slideanimationcontroller = AnimationController(vsync: this,duration: const Duration(milliseconds: 1000),);

    slideanimation = Tween(
      begin:  Offset(-2,-5),
      end: Offset(0,0),
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

  preferredSize: Size(screenSize.width,70),
  child: AppBarr(scrollController: _scrollController,scrsize: screenSize.height,),
),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
       controller: _scrollController,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: SizedBox(
                    height: screenSize.height*.9,
                    width: screenSize.width,
                    child: Image.asset('assets/background.jpg',
                    fit: BoxFit.cover,),

                  ),
                ),
                // GetBuilder<NavController>(
                //   builder: (con){
                //     return Visibility(
                //         visible:false,
                //         child: Container(
                //             color: Colors.white,
                //             width: MediaQuery.of(context).size.width*0.8,
                //             height: MediaQuery.of(context).size.height*0.5,
                //             child:ElevatedButton(
                //               onPressed: () {
                //                 con.toogle();
                //               },
                //               child: Text('close'),
                //             ) // Your small screen UI here
                //         ));
                //   },
                //
                // ),
                SlideTransition(
                   position: slideanimation,
                    child: FloatingQuickAccessBar(screenSize: screenSize)),
              ],
            ),

            About(),
            Skills(),
            Education(),
            Projects(),
            BottomBar(),
          ],
        ),

      )
    );
  }
}
