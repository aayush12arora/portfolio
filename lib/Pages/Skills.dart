import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/gridview.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    List<String>icons =['assets/flut.png','assets/dart.png','assets/androiddd.png','assets/java.png','assets/firebase.png','assets/studio.png','assets/git.png','assets/githubb.png'];
    var screenSize = MediaQuery.of(context).size;
    List<String>tech =['Flutter','Dart','Android','Java','Firebase','Android Studio','Git','GitHub'];
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(
              top: screenSize.height * 0.04,
              // left: screenSize.width*0.07,
            ),
            padding: EdgeInsets.only(bottom: screenSize.height * 0.1),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.4,
                    ),
                    Container(
                      // margin: EdgeInsets.only(
                      //   left: screenSize.width*0.35,
                      //
                      // ),
                      padding: EdgeInsets.only(bottom: 4),
                      child: Icon(Icons.computer, size: 57),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    Text(
                      'Skills &',
                      style: TextStyle(
                          fontSize: 43,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    Text(
                      'Abilities',
                      style: TextStyle(
                          fontSize: 43,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow),
                    )
                  ],
                ),
                Container(
                  height: screenSize.height,
                  width: screenSize.width * 0.8,
                padding: EdgeInsets.all(screenSize.height*0.1),
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: screenSize.width*0.02,
                    mainAxisSpacing: screenSize.width*0.01,

                  children: List.generate(8, (index) {
                    return Container(
                      decoration: BoxDecoration(

                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(20)
                      ),

                      height: 450,
                      width: 350,

                      //margin: EdgeInsets.all(8),
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                             icons[index],
                              width: 170,
                              height: 170,
                            ),
                            Text(tech[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 15),)
                          ],
                        ),
                      ),
                    );
                  }),
                ),

//                   GridView.count(
//                     crossAxisCount: 3,
//                     crossAxisSpacing: 4.0,
//                     mainAxisSpacing: 4.0,
//                     childAspectRatio: 2/ 1.6, // added this line
//                     children: List.generate(
//                       8,
//                           (index) {
//                         return SizedBox(
//
//                           child: Container(
// child: Column(
//   children: [
//
//         Card(
//
//       child: SizedBox(
//         // height: screenSize.height*0.2,
//         // width: screenSize.width * 0.2,
//         child: Center(child: Image.asset(icons[index]))),
//     ),
//   ],
// ),
//                             color: Colors.black45,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
