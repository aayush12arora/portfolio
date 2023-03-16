import 'package:flutter/material.dart';
import 'package:portfolio/Pages/Projects.dart';

import '../Pages/About.dart';
import '../Pages/HomePage.dart';
class projectsAppBarr extends StatefulWidget {
  const projectsAppBarr({Key? key}) : super(key: key);

  @override
  State<projectsAppBarr> createState() => _projectsAppBarrState();
}

class _projectsAppBarrState extends State<projectsAppBarr> {
  final List _isHovering =[false,false,false,false,false,false,false,];
  final List _onpage =[false,false,false,false,false,false,false,];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Material(
      elevation: 7,
      child: Container(

        color: Colors.white.withOpacity(0.5),
        child:  Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width/10,
              ),
              InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  },
                  child: Text('Aayush Arora',style: TextStyle(color: Colors.black87,fontSize: 26,fontFamily: 'Raleway',fontWeight: FontWeight.w900,letterSpacing: 3),)),
              SizedBox(
                width: screenSize.width/4,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: InkWell(

                  onHover: (value){
                    setState(() {
                      value?
                      _isHovering[0]=true:_isHovering[0]=false;

                    });
                  },
                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder:(context)=> About() ));

                  },
                  child:Column(
                    children: [
                      Text('About',style: TextStyle(color: Colors.black87,fontSize: 18,fontFamily: 'Raleway',fontWeight: FontWeight.w600,letterSpacing: 3),),
                      SizedBox(height: 2),
                      Stack(

                          children: [Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 40,
                              color:Colors.black,
                            ),
                          ),


                          ]
                      ),

                    ],
                  ) ,
                ),
              ),
              //skills
              SizedBox(
                width: screenSize.width/20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: InkWell(

                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> Projects() ));
                  },
                  child:Column(
                    children: [
                      Text('Skills',style: TextStyle(color: Colors.black87,fontSize: 18,fontFamily: 'Raleway',fontWeight: FontWeight.w600,letterSpacing: 3),),
                      SizedBox(height: 2),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[1],
                        child: Container(
                          height: 2,
                          width: 40,
                          color:Colors.black,
                        ),
                      ),

                    ],
                  ) ,
                ),
              ),

              //Education
              SizedBox(
                width: screenSize.width/20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: InkWell(
                  onHover: (value){
                    setState(() {
                      value?
                      _isHovering[2]=true:_isHovering[2]=false;

                    });
                  },
                  onTap: (){},
                  child:Column(
                    children: [
                      Text('Education',style: TextStyle(color: Colors.black87,fontSize: 18,fontFamily: 'Raleway',fontWeight: FontWeight.w600,letterSpacing: 3),),
                      SizedBox(height: 2),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[2],
                        child: Container(
                          height: 2,
                          width: 60,
                          color:Colors.black,
                        ),
                      )
                    ],
                  ) ,
                ),
              ),
              //Projects
              SizedBox(
                width: screenSize.width/20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: InkWell(

                  onTap: (){},
                  child:Column(
                    children: [
                      Text('Projects',style: TextStyle(color: Colors.black87,fontSize: 18,fontFamily: 'Raleway',fontWeight: FontWeight.w600,letterSpacing: 3),),
                      SizedBox(height: 2),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: true,
                        child: Container(
                          height: 2,
                          width: 50,
                          color:Colors.black,
                        ),
                      )
                    ],
                  ) ,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}