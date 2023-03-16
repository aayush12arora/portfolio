

import 'package:flutter/material.dart';

import 'bottombar.dart';
import 'infotext.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);
  static  Color gradientStartColor =Colors.teal.shade300;
  static const Color gradientEndColor =  Color(0xffffccbc)  ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),

        gradient: LinearGradient(
            colors: [
              gradientStartColor,
              gradientEndColor
            ],
            begin: const FractionalOffset(0.2, 0.2),
            end: const FractionalOffset(0.7, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      padding: EdgeInsets.all(30),
      //color: Colors.blueGrey[900],
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarColumn(
                heading: 'ABOUT',
                s1: 'Contact ',
                s2: 'About Us',
                s3: 'Careers',
              ),
              Container(
                color: Colors.white,
                width: 2,
                height: 150,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoText(
                    type: 'Email',
                    text: 'aa373@snu.edu.in',
                  ),
                  SizedBox(height: 5),
                  InfoText(
                    type: 'Contact',
                    text: '+ 91 8171254458',
                  )
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(height: 20),
          Text(
            'Copyright © 2023 | Aayush Arora',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}