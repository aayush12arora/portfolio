import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/footer.dart';

import '../Widgets/AppBar.dart';
import '../Widgets/abtappbar.dart';
import '../Widgets/floatingwidget.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return

   Stack(

        children: [
screenSize.width>950?
          Container(
color: Colors.white,
            child: SizedBox(
              height: screenSize.height,
              width: screenSize.width,


            ),
          ):Container(
  height: screenSize.height,
  color: Color.fromRGBO(253, 230, 224, 100),

),

          Padding(
            padding: EdgeInsets.only(
          top: screenSize.height * 0.06,


          ),
            child: Container(
              margin: EdgeInsets.only(
                top: screenSize.height*0.04,
                left: screenSize.width*0.1,
              ),
              padding: EdgeInsets.only(bottom: screenSize.height*0.1),
              color: Colors.white,
              child: Column(
                children: [
                  Row(

                    children: [
                      SizedBox(
                        width:screenSize.width*0.3,
                      ),
                      Container(
                          // margin: EdgeInsets.only(
                          //   left: screenSize.width*0.35,
                          //
                          // ),
padding: EdgeInsets.only(bottom: 4),
                          child: Icon(Icons.person,size: 57,)),
                      SizedBox(
                        width:screenSize.width*0.01,
                      ),
                      Text('About Me',style: TextStyle(fontSize: 43,fontWeight: FontWeight.bold,color: Colors.brown),)
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height*0.03,
                  ),
                  Row(
                    children: [
                      Container(

                      //  padding: EdgeInsets.all(16.0),
                        width: screenSize.width * 0.2,
                        height: screenSize.height*0.575,
                        decoration: BoxDecoration(

    color: Colors.white,
                          borderRadius: BorderRadius.circular(100.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2,
                              blurRadius: 2,
                              // offset: Offset(3, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ClipRRect(

                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset('assets/about.jpg')),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: screenSize.width*0.15,

                        ),
                        padding: EdgeInsets.only(
                          top: screenSize.height*0.08,
                        ),
                        height: screenSize.height*0.76,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("I'm Aayush",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),
                            SizedBox(height: screenSize.height*0.03,),
                            Text("I was born and raised in Meerut, and spent my childhood",style: TextStyle(fontSize: 22),),
                            SizedBox(height: screenSize.height*0.003,),
                            Text("years in Hastinapur. I'm a Second year B.Tech Computer ",style: TextStyle(fontSize: 22),),
                            SizedBox(height: screenSize.height*0.003,),
                            Text("Science and Engineering student at Shiv Nadar University.",style: TextStyle(fontSize: 22),),

                            SizedBox(height: screenSize.height*0.032,),
                            Text("I am interested in the field of Mobile Development ,UX/UI ",style: TextStyle(fontSize: 22),),
                            SizedBox(height: screenSize.height*0.003,),
                            Text("Design, Competitive programming and wish to find trainings/",style: TextStyle(fontSize: 22),),
                            SizedBox(height: screenSize.height*0.003,),
                            Text("internships/job for the same.",style: TextStyle(fontSize: 22),),
                            SizedBox(height: screenSize.height*0.033,),
                            Text("Feel free to check out my profile and connect with me",style: TextStyle(fontSize: 22),),
//                             SizedBox(height: screenSize.height*0.033,),
//                             InkWell(
//                               onTap: (){
//
//                               },
//                               child: Container(
// //padding: EdgeInsets.all(4.0),
// //width: widget.screenSize.width*0.08,
//                                 // height: widget.screenSize.height*0.07,
//                                   decoration: BoxDecoration(
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.purple.shade200,
//                                           spreadRadius: 3,
//                                           blurRadius: 7,
//                                           // offset: Offset(3, 3), // changes position of shadow
//                                         ),
//                                       ],
//                                       color: Colors.teal.shade300,
//                                       borderRadius: BorderRadius.circular(20)
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 18.0,right: 18.0,top: 9.0,bottom: 9.0),
//                                     child: Text('Connect',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
//                                   )
//                               ),
//                             ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
    ]
      );

  }
}
