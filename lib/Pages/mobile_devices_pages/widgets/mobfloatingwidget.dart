import 'dart:collection';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:portfolio/Pages/Hire_me_Page.dart';

import 'package:portfolio/providers/Navprovider.dart';
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';

import 'package:url_launcher/url_launcher.dart';

class MobFloatingQuickAccessBar extends StatefulWidget {
  const MobFloatingQuickAccessBar({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _MobFloatingQuickAccessBarState createState() =>
      _MobFloatingQuickAccessBarState();
}

class _MobFloatingQuickAccessBarState extends State<MobFloatingQuickAccessBar> {
  List dropdownItemList = [
    {'label': 'About', 'value': 'About'}, // label is required and unique
    {'label': 'Skills', 'value': 'Skills'},
    {'label': 'Education', 'value': 'Education'},
    {'label': 'Projects', 'value': 'Projects'},
  ];
  String dropdownValue = 'Menu';
  Map<String, dynamic> Selectedperson = new HashMap();
  NavController controller = Get.find();
  bool isSmallScreenVisible = false;
  final Uri _urigit = Uri.parse('https://github.com/aayush12arora');
  final Uri _urileet = Uri.parse('https://leetcode.com/aayush12arora/');
  final Uri _urilinked =
      Uri.parse('https://www.linkedin.com/in/aayush-arora-a86580217/');
  List _isHovering = [false, false, false, false];
  List<Widget> rowElements = [];

  Future<void> _launchUrl(Uri _uri) async {
    if (!await launchUrl(_uri)) {
      throw Exception('Could not launch $_uri');
    }
  }

  _mailto() async {
    const url = 'mailto:aa373@snu.edu.in?subject=Product Inquiry&body=';
    print("test url1");
    if (await canLaunch(url)) {
      print("test url2");
      await launch(url);
    } else {
      print("test url3");
      throw 'Could not launch $url';
    }
  }


  // get data from firebase
  Future<String> getDataFromFirebase(String collection, String docum) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
    await FirebaseFirestore.instance.collection(collection).doc(docum).get();

    if (snapshot.exists) {
      final data = snapshot.data();
      final yourData = data!['wh'] as String?;
      return yourData ?? 'No data available';
    } else {
      return 'No data found';
    }
  }

  // fetch data function
  Future<String> fetchData(String collection, String docum) async {
    String result = await getDataFromFirebase(collection, docum);
    return result;
  }


  Future<Widget> generateRowElements  () async  {


//getData();
    Widget elementTile = Column(
        children:[
          //SizedBox(width: widget.screenSize.width*3/4,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                await   fetchData("HomePage", "helloline") as String,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 35,
                    color:  Colors.black,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 5.0),
                        blurRadius: 3.0,
                        color: Colors.indigo.shade100,
                      ),]
                ),
              ),
              SizedBox(  height: widget.screenSize.height / 55,),
              Text(
                await   fetchData("HomePage", "intro_nameline") as String,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 35,
                    color:  Colors.black,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 5.0),
                        blurRadius: 3.0,
                        color: Colors.indigo.shade100,
                      ),]
                ),
              ),
              SizedBox(height: widget.screenSize.width/40,),
              Row(

                children: [
                  Text("I am a ",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),),
                  Text(await   fetchData("HomePage", "role") as String,style: TextStyle(color: Colors.purple.shade900,fontSize: 22,fontWeight: FontWeight.w600),),
                  Text(" !",style: TextStyle(color: Colors.purple.shade900,fontSize: 22,fontWeight: FontWeight.w600),),
                ],
              ),
              SizedBox(height: widget.screenSize.width/30,),
              InkWell(
                onTap: (){
                   Get.to(()=>ContactFormPage(1));
                  controller.toogle();
                },
                onHover: (value){},
                child: Container(
//padding: EdgeInsets.all(4.0),
//width: widget.screenSize.width*0.08,
                  // height: widget.screenSize.height*0.07,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.shade200,
                            spreadRadius: 3,
                            blurRadius: 7,
                            // offset: Offset(3, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.teal.shade300,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0,right: 18.0,top: 9.0,bottom: 9.0),
                      child: Text('Hire Me',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                    )
                ),
              ),
              SizedBox(height: widget.screenSize.width/55,),
              Row(

                children: [
                  InkWell(
                    onTap: (){
                      html.window.open('https://www.linkedin.com/in/aayush-arora-a86580217/',"_blank");


                    },
                    child: CircleAvatar(
                      // child: Image.asset('assests/github.png'),
//child: Image.asset('assets/linkedin.png'),
                      backgroundImage: ExactAssetImage('assets/linkedin.png',),
                      minRadius: 20,

                    ),
                  ),
                  SizedBox(width: widget.screenSize.width*0.01,),
                  InkWell(
                    onTap: (){
                      html.window.open('https://leetcode.com/aayush12arora/',"_blank");

                    },
                    child: CircleAvatar(
                      // child: Image.asset('assests/github.png'),
//child: Image.asset('assets/linkedin.png'),
                      backgroundImage: ExactAssetImage('assets/leetcode.png',),
                      minRadius: 20,

                    ),
                  ),
                  SizedBox(width: widget.screenSize.width*0.01,),
                  InkWell(
                    onTap: (){

                      html.window.open('https://github.com/aayush12arora',"_blank");
                    },
                    child: CircleAvatar(
                      // child: Image.asset('assests/github.png'),
//child: Image.asset('assets/linkedin.png'),
                      backgroundImage: ExactAssetImage('assets/github.png',),
                      minRadius: 20,

                    ),
                  ),

                  SizedBox(width: widget.screenSize.width*0.01,),
                  CircleAvatar(
                    // child: Image.asset('assests/github.png'),
//child: Image.asset('assets/linkedin.png'),
                    child: IconButton(icon: Icon(Icons.mail_rounded), onPressed: () {
                      _mailto();
                    },),
                    //backgroundImage: ExactAssetImage('assets/github.png',),
                    minRadius: 20,

                  ),

                ],
              )

            ],
          ),

        ]
    );




    return elementTile;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(
                top: widget.screenSize.height * 0.08,
                left: widget.screenSize.width * 0.2,
                right: widget.screenSize.width * 0.04,
              ),
              child: Center(child:   FutureBuilder<Widget>(
                future: generateRowElements(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      // Handle error case
                      return Text('Error: ${snapshot.error}');
                    }
                    // Return the widget when the future is complete
                    return snapshot.data ?? Container(); // Use a default widget or provide a fallback
                  } else {
                    // Show a loading indicator while the future is still loading
                    return CircularProgressIndicator();
                  }
                },
              ),)),
          Padding(
            padding: EdgeInsets.only(
              top: widget.screenSize.height * 0.03,
              left: widget.screenSize.width * 0.2,
              right: widget.screenSize.width * 0.04,
            ),
            child: CircleAvatar(
              backgroundImage: ExactAssetImage(
                'assets/biti.png',
              ),
              backgroundColor: Colors.pinkAccent.shade200,
              radius: widget.screenSize.width / 5,
            ),
          )
        ],
      ),
    );
  }
}
