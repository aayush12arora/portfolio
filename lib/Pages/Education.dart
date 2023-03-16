
import 'package:flutter/material.dart';
class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [ Container(
        color: Colors.indigo.shade50,

        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,

        ),
      ),
        Container(
          margin: EdgeInsets.only(
            top: screenSize.height*0.04,
            left: screenSize.width*0.1,
          ),
          padding: EdgeInsets.only(bottom: screenSize.height*0.1),
        //  color: Colors.indigo.shade50,
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
                      child: Icon(Icons.computer,size: 57,)),
                  SizedBox(
                    width:screenSize.width*0.01,
                  ),
                  Text('My',style: TextStyle(fontSize: 43,fontWeight: FontWeight.bold,color: Colors.black54),),
                  SizedBox(
                    width:screenSize.width*0.01,
                  ),
                  Text('Education',style: TextStyle(fontSize: 43,fontWeight: FontWeight.bold,color: Colors.purple,))
                ],
              ),


Container(
  margin:EdgeInsets.only(top: screenSize.height*0.04,),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
  ),
  height: screenSize.height*0.3,
  child:   Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    margin:  EdgeInsets.only(left:screenSize.width*0.05,top: screenSize.height*0.05,right:screenSize.width*0.08, ),
    elevation: 4,
    child:   Row(
      children: [
        Container(
          height: screenSize.height*0.3,
        //  width: screenSize.width*0.1,
          child: Image.asset('assets/snu.jpg') ,
        ),
        Container(
          margin: EdgeInsets.only(left:15 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:screenSize.height*0.025 ,),
              Text('Bachelor of Engineering in CSE',style: TextStyle(fontSize: 31,fontFamily:'Roboto',fontWeight: FontWeight.w700,color: Colors.blue.shade900),),
              SizedBox(height:screenSize.height*0.025 ,),
              Text(' Shiv Nadar University | SNIOE',style: TextStyle(fontSize: 20,color: Colors.black),),
              SizedBox(height:screenSize.height*0.025 ,),
              Text(' 2021 - 2025 | Pursuing',style: TextStyle(fontSize: 20,color: Colors.green),),
            ],
          ),
        )
      ]
    ),
  ),
),
              Container(
                margin: EdgeInsets.only(top: screenSize.height*0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                height: screenSize.height*0.3,
                child:   Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin:  EdgeInsets.only(left:screenSize.width*0.05,top: screenSize.height*0.05,right:screenSize.width*0.08, ),
                  elevation: 4,
                  child:   Row(
                      children: [
                        Container(
                          height: screenSize.height*0.3,
                         // width: screenSize.width*0.1,
                          child: Image.asset('assets/mietps.jpg') ,
                        ),
                        Container(
                          margin: EdgeInsets.only(left:15 ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height:screenSize.height*0.025 ,),
                              Text('All India Senior School Certificate Examination',style: TextStyle(fontSize: 31,fontFamily:'Roboto',fontWeight: FontWeight.w700,color: Colors.blue.shade900),),
                              SizedBox(height:screenSize.height*0.025 ,),
                              Text(' Meerut Institute of Engineering & Technology| MIET',style: TextStyle(fontSize: 20,color: Colors.black),),
                              SizedBox(height:screenSize.height*0.025 ,),
                              Text(' 2020 - 2021 | Completed',style: TextStyle(fontSize: 20,color: Colors.green),),
                            ],
                          ),
                        )
                      ]
                  ),
                ),
              )

            ],

          ),
        )

      ],
    );
  }
}
