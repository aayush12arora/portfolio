import 'package:flutter/material.dart';
import 'package:portfolio/Pages/About.dart';
import 'package:portfolio/Pages/Education.dart';
import 'package:portfolio/Pages/Projects.dart';
import 'package:portfolio/Pages/Skills.dart';
import 'package:portfolio/Widgets/AppBar.dart';
import 'package:portfolio/Widgets/floatingwidget.dart';

import '../Widgets/Menu_drawer.dart';
import '../Widgets/abtappbar.dart';
import '../Widgets/footer.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
  child: screenSize.width<1235?AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    title: Text('Aayush Arora',style: TextStyle(color: Colors.black87,fontSize: 26,fontFamily: 'Raleway',fontWeight: FontWeight.w900,letterSpacing: 3),),
  ) :AppBarr(scrollController: _scrollController,scrsize: screenSize.height,),
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
