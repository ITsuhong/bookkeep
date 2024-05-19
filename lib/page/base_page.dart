import 'package:bookkeep/page/home_page.dart';
import 'package:bookkeep/page/mine_page.dart';
import 'package:bookkeep/page/record_page.dart';
import 'package:bookkeep/page/tool_page.dart';
import 'package:bookkeep/widget/cus_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/HexColor.dart';

class BasePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BasePageState();
  }
}

class _BasePageState extends State<BasePage> {
  List<Widget> _pages = [HomePage(), RecordPage(), ToolPage(), MinePage()];
  int _currentIndex = 0;

  onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: SafeArea(
          top: false,
          bottom: false,
          maintainBottomViewPadding: true,
          child: Stack(
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
              )),
              Positioned.fill(
                  child: IndexedStack(
                index: _currentIndex,
                children: _pages,
              )),
              Positioned(
                  bottom: 15,
                  child: CusBottomBar(
                      currentIndex: _currentIndex, onTabChanged: onTabChanged)),
            ],
          ),
        ));
  }
}
