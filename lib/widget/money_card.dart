import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/HexColor.dart';

class MoneyCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoneyCardState();
  }
}

class MoneyCardState extends State<MoneyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              HexColor('#E6B1B4'),
              HexColor('#00B0EA'), // Add more colors if needed
            ],
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            // BoxShadow(
            //     color: Colors.black12,
            //     offset: Offset(0.1, 0.0),
            //     blurRadius: 1.0)
          ]),
      width: double.infinity,
      height: 100,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "吃中午饭",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text("这是备注", style: TextStyle(color: Colors.grey[300]))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "-1000",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                Text(
                  "05-01 22:30",
                  style: TextStyle(color: Colors.grey[300]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
