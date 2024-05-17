import 'package:bookkeep/widget/cus_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/HexColor.dart';

class BasePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BasePageState();
  }
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
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
          Positioned(bottom: 15, child: CusBottomBar())
        ],
      ),
    );
  }
}
