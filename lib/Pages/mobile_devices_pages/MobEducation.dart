import 'package:flutter/material.dart';

class MobEducation extends StatefulWidget {
  const MobEducation({Key? key}) : super(key: key);

  @override
  State<MobEducation> createState() => _MobEducationState();
}

class _MobEducationState extends State<MobEducation> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: Colors.indigo.shade50,
          child: SizedBox(
            height: screenSize.height*2,
            width: screenSize.width,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: screenSize.height * 0.04,
            left: screenSize.width * 0.1,
          ),
          padding: EdgeInsets.only(bottom: screenSize.height * 0.1),
          //  color: Colors.indigo.shade50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                      // margin: EdgeInsets.only(
                      //   left: screenSize.width*0.35,
                      //
                      // ),
                      padding: EdgeInsets.only(bottom: 4),
                      child: Icon(
                        Icons.computer,
                        size: 24,
                      )),
                  SizedBox(
                    width: screenSize.width * 0.01,
                  ),
                  Text(
                    'My',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    width: screenSize.width * 0.01,
                  ),
                  Text('Education',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ))
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: screenSize.height * 0.07,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                height: screenSize.height * 0.8,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: EdgeInsets.only(
                    left: screenSize.width * 0.01,
                    top: screenSize.height * 0.01,
                    right: screenSize.width * 0.1,
                  ),
                  elevation: 4,
                  child: Column(children: [
                    Container(
                      height: screenSize.height * 0.3,
                      //  width: screenSize.width*0.1,
                      child: Image.asset('assets/snu.jpg'),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15,right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenSize.height * 0.025,
                          ),
                          Text(
                            'Bachelor of Engineering in CSE',
                            style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                color: Colors.blue.shade900),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.025,
                          ),
                          Text(
                            ' Shiv Nadar University | SNIOE',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.025,
                          ),
                          Text(
                            ' 2021 - 2025 | Pursuing',
                            style: TextStyle(fontSize: 20, color: Colors.green),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                height: screenSize.height * 0.9,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: EdgeInsets.only(
                    left: screenSize.width * 0.01,
                    top: screenSize.height * 0.02,
                    right: screenSize.width * 0.1,
                  ),
                  elevation: 4,
                  child: Column(children: [
                    Container(
                      height: screenSize.height * 0.3,
                      // width: screenSize.width*0.1,
                      child: Image.asset('assets/mietps.jpg'),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15,right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenSize.height * 0.025,
                          ),
                          Text(
                            'All India Senior School Certificate Examination',
                            style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                color: Colors.blue.shade900),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.025,
                          ),
                          Text(
                            ' Meerut Institute of Engineering & Technology| MIET',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.025,
                          ),
                          Text(
                            ' 2020 - 2021 | Completed',
                            style: TextStyle(fontSize: 20, color: Colors.green),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
