import 'package:bookkeep/utils/HexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CusBottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CusBottomBarState();
  }
}

class _CusBottomBarState extends State<CusBottomBar> {
  List data = [
    "assets/bottom/house.png",
    "assets/bottom/record.png",
    "assets/bottom/add.png",
    "assets/bottom/mine.png",
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget buildBottomItem(String path, int Index) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..scale(_currentIndex == Index ? 1.3 : 1.0),
              child: Image.asset(path, height: 45),
            ),
          ),
          Positioned(
              bottom: -8,
              left: 0,
              right: 0,
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  height: 3,
                  width: _currentIndex == Index ? 35 : 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        HexColor('#FDF1CB'),
                        HexColor('#96F8E3'), // Add more colors if needed
                      ],
                    ),
                  ),
                ),
              ))
        ],
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
            color: HexColor('#b39bc9'),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              //阴影
              BoxShadow(
                  color: HexColor('#b39bc9'),
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0)
            ]),
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              4,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: buildBottomItem(data[index], index),
                  )),
        ),
      ),
    );
  }
}
