import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/HexColor.dart';

class AddToPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddToPage();
  }
}

class _AddToPage extends State<AddToPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
                height: double.infinity,
                width: double.infinity,
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
              ))
        ],
      ),
    );
  }
}
