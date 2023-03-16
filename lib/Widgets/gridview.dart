import 'package:flutter/material.dart';

class MyGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView.count(
        crossAxisCount: 4,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 4),
        children: List.generate(
          12,
              (index) => Container(
            color: Colors.blue,
            margin: EdgeInsets.all(8),
            child: Center(
              child: Text(
                'Box ${index + 1}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          )
    )
    );


  }
}
