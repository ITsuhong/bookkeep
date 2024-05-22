import 'package:bookkeep/utils/HexColor.dart';
import 'package:bookkeep/widget/money_calendar.dart';
import 'package:bookkeep/widget/money_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  left: 10,
                ),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: <Color>[HexColor("#FDA3EB"), HexColor('#00D1FF')],
                      tileMode: TileMode.mirror,
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.srcATop,
                  child: Text(
                    '日历',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   colors: [
                    //     HexColor('#B6DCE6'),
                    //     HexColor('#FEC4B1 '), // Add more colors if needed
                    //   ],
                    // ),
                    ),
                child: MoneyCalendar()),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: <Color>[HexColor("#FDA3EB"), HexColor('#00D1FF')],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: Text(
                  '记录明细',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                      // padding: const EdgeInsets.all(20.0),
                      itemCount: 8,
                      // itemExtent: .0, //强制高度为50.0
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: MoneyCard(),
                        );
                      })),
            ))
          ],
        ),
        Positioned(
            right: 20,
            bottom: 150,
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/add');
              },
              child: Container(
                width: 80,
                height: 80,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
                    //阴影
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0)
                  ],
                  gradient: LinearGradient(
                      colors: [HexColor('#faf1cc'), HexColor('#9bf8e2')]),
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/add.png',
                ),
              ),
            )),
      ],
    );
  }
}
