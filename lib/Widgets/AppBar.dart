import 'package:flutter/material.dart';
import 'package:portfolio/Pages/HomePage.dart';

import '../Pages/About.dart';
class AppBarr extends StatefulWidget {

  final ScrollController scrollController;
  var scrsize;
  AppBarr({required this.scrollController,@required this.scrsize}) ;

  @override
  State<AppBarr> createState() => _AppBarrState();
}

class _AppBarrState extends State<AppBarr> {
  final List _isHovering =[false,false,false,false,false,false,false,];
  final List _onpage =[false,false,false,false,false,false,false,];
@override
  void initState() {
    // TODO: implement initState
widget.scrollController.addListener(() {
  if(widget.scrollController.offset<widget.scrsize){
    setState(() {
      _isHovering[0] = false; // set hover state to true
      _onpage[0] = false;

      //------------
      _isHovering[2] = false; // set hover state to true
      _onpage[2] = false;
      //----------
      _isHovering[1] = false; // set hover state to true
      _onpage[1] = false;
      //------------
      _isHovering[3] = false; // set hover state to true
      _onpage[3] = false;
      //--------
    });
  }
 if(widget.scrollController.offset>=widget.scrsize&&widget.scrollController.offset<widget.scrsize*2){

   setState(() {
     print('here');
     _isHovering[0] = true; // set hover state to true
     _onpage[0] = true;

     //------------
     _isHovering[2] = false; // set hover state to true
     _onpage[2] = false;
     //----------
     _isHovering[1] = false; // set hover state to true
     _onpage[1] = false;
     //------------
     _isHovering[3] = false; // set hover state to true
     _onpage[3] = false;
     //--------
   });
 }
 if(widget.scrollController.offset>=widget.scrsize*2&&widget.scrollController.offset<widget.scrsize*3){
   setState(() {
     _isHovering[1] = true; // set hover state to true
     _onpage[1] = true;

     //------------
     _isHovering[2] = false; // set hover state to true
     _onpage[2] = false;
     //----------
     _isHovering[0] = false; // set hover state to true
     _onpage[0] = false;
     //------------
     _isHovering[3] = false; // set hover state to true
     _onpage[3] = false;
     //--------
   });
 }

 if(widget.scrollController.offset>=widget.scrsize*3&&widget.scrollController.offset<widget.scrsize*4){
   setState(() {
     _isHovering[2] = true; // set hover state to true
     _onpage[2] = true;

     //------------
     _isHovering[1] = false; // set hover state to true
     _onpage[1] = false;
     //----------
     _isHovering[0] = false; // set hover state to true
     _onpage[0] = false;
     //------------
     _isHovering[3] = false; // set hover state to true
     _onpage[3] = false;
     //--------
   });
 }
 if(widget.scrollController.offset>=widget.scrsize*4){
   setState(() {
     _isHovering[3] = true; // set hover state to true
     _onpage[3] = true;

     //------------
     _isHovering[1] = false; // set hover state to true
     _onpage[1] = false;
     //----------
     _isHovering[0] = false; // set hover state to true
     _onpage[0] = false;
     //------------
     _isHovering[2] = false; // set hover state to true
     _onpage[2] = false;
     //--------
   });
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
                    if(!_onpage[0]){ // check if button is not active
                      setState(() {
                        _isHovering[0] = value; // set hover state to current hover value
                      });
                    }
                  },

                  onTap: (){
                    setState(() {
                      _isHovering[0] = true; // set hover state to true
                      _onpage[0] = true;

                      //------------
                      _isHovering[2] = false; // set hover state to true
                      _onpage[2] = false;
                      //----------
                      _isHovering[1] = false; // set hover state to true
                      _onpage[1] = false;
                      //------------
                      _isHovering[3] = false; // set hover state to true
                      _onpage[3] = false;
                      //--------
                    });
                    widget.scrollController.animateTo(
                      screenSize.height,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                   // widget.scrollController.jumpTo(548);
                  //  Navigator.push(context, MaterialPageRoute(builder:(context)=> About() ));

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
                  onHover: (value){
                    if(!_onpage[1]){ // check if button is not active
                      setState(() {
                        _isHovering[1] = value; // set hover state to current hover value
                      });
                    }
                  },

                  onTap: (){
                    setState(() {
                      _isHovering[1] = true; // set hover state to true
                      _onpage[1] = true;

                      //------------
                      _isHovering[2] = false; // set hover state to true
                      _onpage[2] = false;
                      //----------
                      _isHovering[0] = false; // set hover state to true
                      _onpage[0] = false;
                      //------------
                      _isHovering[3] = false; // set hover state to true
                      _onpage[3] = false;
                      //--------
                    });
                    widget.scrollController.animateTo(
                      screenSize.height*2,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                    // widget.scrollController.jumpTo(548);
                    //  Navigator.push(context, MaterialPageRoute(builder:(context)=> About() ));

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
                    if(!_onpage[2]){ // check if button is not active
                      setState(() {
                        _isHovering[2] = value; // set hover state to current hover value
                      });
                    }
                  },

                  onTap: (){
                    setState(() {
                      _isHovering[2] = true; // set hover state to true
                      _onpage[2] = true;
                      _onpage[2]=true;
                      //------------
                      _isHovering[0] = false; // set hover state to true
                      _onpage[0] = false;
                      //----------
                      _isHovering[1] = false; // set hover state to true
                      _onpage[1] = false;
                      //------------
                      _isHovering[3] = false; // set hover state to true
                      _onpage[3] = false;
                      //--------
                    });



                    widget.scrollController.animateTo(
                      screenSize.height*3.25,
                      duration: Duration(milliseconds: 700),
                      curve: Curves.easeInOut,
                    );
                    // widget.scrollController.jumpTo(548);
                    //  Navigator.push(context, MaterialPageRoute(builder:(context)=> About() ));

                  },
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
                  onHover: (value){
                    if(!_onpage[3]){ // check if button is not active
                      setState(() {
                        _isHovering[3] = value; // set hover state to current hover value
                      });
                    }
                  },

                  onTap: (){
                    setState(() {
                      _isHovering[3] = true; // set hover state to true
                      _onpage[3] = true;
                      _onpage[3]=true;
                      //------------
                      _isHovering[0] = false; // set hover state to true
                      _onpage[0] = false;
                      //----------
                      _isHovering[1] = false; // set hover state to true
                      _onpage[1] = false;
                      //------------
                      _isHovering[2] = false; // set hover state to true
                      _onpage[2] = false;
                      //--------
                    });



                    widget.scrollController.animateTo(
                      screenSize.height*4.35,
                      duration: Duration(milliseconds: 700),
                      curve: Curves.easeInOut,
                    );
                    // widget.scrollController.jumpTo(548);
                    //  Navigator.push(context, MaterialPageRoute(builder:(context)=> About() ));

                  },
                  child:Column(
                    children: [
                      Text('Projects',style: TextStyle(color: Colors.black87,fontSize: 18,fontFamily: 'Raleway',fontWeight: FontWeight.w600,letterSpacing: 3),),
                      SizedBox(height: 2),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[3],
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