
import 'package:flutter/material.dart';
import 'dart:html' as html;
class Projects extends StatefulWidget {
const Projects({Key? key}) : super(key: key);

@override
State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
List< double>big =[1.0 ,1.0,1.0];
List<Color> given =[Colors.indigo.shade50,Colors.indigo.shade50,Colors.indigo.shade50,];
Color ele = Colors.indigo.shade50;
Color elev = Colors.grey.shade400;
@override
Widget build(BuildContext context) {
  List<String>urls=['https://github.com/aayush12arora/ISC-Slot-Booking-App.git','https://github.com/aayush12arora/Crypto-Currency-Tracker.git','https://github.com/aayush12arora/lets_build___.git'];
  List<String> project =['Gym Slot Booking App','Crypto Tracker ','Import/Export '];
  List<String> projectdes =['Gym Slot Booking App','Crypto Tracker ','Import/Export '];
  List<String> projectrw =['Android and Backend','Flutter - Dart REST API ','Flutter - Dart and FireBase'];
  var screenSize = MediaQuery.of(context).size;
  return Stack(

    children: [ Container(
       color:  Colors.white,
      height: screenSize.height,
      width: screenSize.width,

    ),
      Center(
        child: Container(
          margin: EdgeInsets.only(
            top: screenSize.height*0.2,
           // left: screenSize.width*0.1,
          ),
          padding: EdgeInsets.only(bottom: screenSize.height*0.1),
          //  color: Colors.indigo.shade50,
          child: Column(
            children: [
              Row(

                children: [
                  SizedBox(
                    width:screenSize.width*0.4,
                  ),
                  Container(
                    // margin: EdgeInsets.only(
                    //   left: screenSize.width*0.35,
                    //
                    // ),
                      padding: EdgeInsets.only(bottom: 4),
                      child: Icon(Icons.computer,size: 57,)),
                  SizedBox(
                    width:screenSize.width*0.01,
                  ),
                  Text('Projects',style: TextStyle(fontSize: 43,fontWeight: FontWeight.bold,color: Colors.black),),
                  SizedBox(
                    width:screenSize.width*0.01,
                  ),
                  Text('Made',style: TextStyle(fontSize: 43,fontWeight: FontWeight.bold,color: Colors.yellow.shade900,))
                ],
              ),
              SizedBox(
                height:screenSize.height*0.08,
              ),
              Container(
                height: screenSize.height * 0.8,
                width: screenSize.width ,
                padding: EdgeInsets.all(screenSize.height*0.08),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: screenSize.width*0.02,
                  mainAxisSpacing: screenSize.width*0.01,
childAspectRatio: 200/170,
                  children: List.generate(3, (index) {
                    return InkWell(
                      onTap: (){
                        html.window.open(urls[index] as String,"_blank");
                      },
                      onHover: (value){
                        setState(() {
                          if(value){
                            given[index] = elev;
                            big[index]=1.06;
                          }
                          else{
                            given[index] =ele;
                            big[index]=1.0;
                          }

                        });

                      },
                      child: Transform.scale(
                        scale: big[index],
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInCubic,
                          decoration: BoxDecoration(
                              color: given[index],

                              borderRadius: BorderRadius.circular(20)
                          ),




                          child: Center(
                            child: Column(
                              children: [
SizedBox(height: 35,),
                               Text(project[index],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 27),),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Expanded(
                                      flex: 1,
                                      child: Text(projectdes[index],style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w200),)),
                                ),
Container(
width: screenSize.width/5,
height: screenSize.height/10,
padding: EdgeInsets.all(8),
decoration: BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(22)

),
child: Center(child: Text(projectrw[index])),
)

                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),


              ),
              //Text('hell',style: TextStyle(fontSize: 36),)
            ],
          ),
        ),
      )

    ],
  );
}
}
