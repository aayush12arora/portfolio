
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';

import 'package:url_launcher/url_launcher.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {

  final Uri _urigit = Uri.parse('https://github.com/aayush12arora');
  final Uri _urileet = Uri.parse('https://leetcode.com/aayush12arora/');
  final Uri _urilinked = Uri.parse('https://www.linkedin.com/in/aayush-arora-a86580217/');
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
  Widget generateRowElements() {


    Widget elementTile = Row(
        children:[Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi There,',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 41,
                  color:  Colors.black,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(10.0, 5.0),
                      blurRadius: 3.0,
                      color: Colors.indigo.shade100,
                    ),]
              ),
            ),
            SizedBox(height: widget.screenSize.width/90,),
          
          ],
        ),

          SizedBox(width: widget.screenSize.width/5,),
          CircleAvatar(
            backgroundImage: ExactAssetImage('assets/biti.png',),
            backgroundColor: Colors.pinkAccent.shade200,
            radius: widget.screenSize.height/4,
          )
        ]
    );




    return elementTile;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
            top: widget.screenSize.height * 0.15,
            left:
            widget.screenSize.width / 7,

            right:
            widget.screenSize.width / 12

        ),
        child: Container(
          child: Row(
            children: [
              generateRowElements(),
            ],
          ),
        ),
      ),
    );
  }
}