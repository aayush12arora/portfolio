
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
class MobProjects extends StatefulWidget {
  const MobProjects({Key? key}) : super(key: key);

  @override
  State<MobProjects> createState() => _MobProjectsState();
}

class _MobProjectsState extends State<MobProjects> {
  List<bool> isHovered = [false, false, false];
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
        Container(
          margin: EdgeInsets.only(
            top: screenSize.height*0.2,
            // left: screenSize.width*0.1,
          ),
          padding: EdgeInsets.only(bottom: screenSize.height*0.1),
          //  color: Colors.indigo.shade50,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(

                          padding: EdgeInsets.only(bottom: 4),
                          child: Icon(Icons.computer,size: 24,)),
                      SizedBox(
                        width:screenSize.width*0.01,
                      ),
                      Text('Projects',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
                      SizedBox(
                        width:screenSize.width*0.01,
                      ),
                      Text('Made',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.yellow.shade900,))
                    ],
                  )




                ],
              ),
              SizedBox(
                height:screenSize.height*0.08,
              ),
              SingleChildScrollView(

                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Projects').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<DocumentSnapshot> documents = snapshot.data!.docs;
                      return GridView.count(

                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        padding: EdgeInsets.all(20.0),
                        crossAxisSpacing: screenSize.width*0.05,
                        mainAxisSpacing: screenSize.height*0.07,
                        shrinkWrap: true, // Set shrinkWrap to true
                        scrollDirection: Axis.vertical
                        ,
                        children: documents.asMap().entries.map((entry) {
                          int index = entry.key;
                          DocumentSnapshot doc = entry.value;
                          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                          return InkWell(
                            onTap: () {
                              String projectUrl = data['project_url'] as String? ?? '';

                              html.window.open(projectUrl, '_blank');
                            },
                            onHover: (value) {
                              setState(() {
                                isHovered[index] = value;
                                if (value) {
                                  given[index] = elev;
                                } else {
                                  given[index] = ele;
                                }
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInCubic,
                              transform: Matrix4.identity()
                                ..scale(isHovered[index] ? 1.06 : 1.0),
                              decoration: BoxDecoration(
                                color: given[index],
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data['project_des'] as String,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Container(
                                    width: screenSize.width/3,
                                    height: screenSize.height/10,

                                    padding: EdgeInsets.all(8),

                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                    child: Center(
                                      child: Text(
                                        data['project_skills'] as String,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
              //Text('hell',style: TextStyle(fontSize: 36),)
            ],
          ),
        )

      ],
    );
  }
}
