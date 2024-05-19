import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/HexColor.dart';

class MoneyCalendar extends StatefulWidget {
  @override
  _MoneyCalendarState createState() => _MoneyCalendarState();
}

class _MoneyCalendarState extends State<MoneyCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TableCalendar(
        rowHeight: 50,
        locale: 'zh_CN',
        focusedDay: _focusedDay,
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        onFormatChanged: (format) {},
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        onDaySelected: (selectedDay, focusedDay) {
          print('selected day: $focusedDay');
          setState(() {
            _focusedDay = focusedDay;
            _selectedDay = selectedDay;
          });
        },
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          // 格式化星期名称
          weekendStyle:
              TextStyle(color: Colors.black26, fontWeight: FontWeight.bold),
          // 周末的文本样式
          weekdayStyle: TextStyle(
              color: Colors.black26, fontWeight: FontWeight.bold), // 平日的文本样式
        ),
        calendarStyle: CalendarStyle(
          defaultTextStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          weekendTextStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          selectedDecoration: BoxDecoration(),
          todayDecoration: BoxDecoration(
            color: Colors.red, // 设置今天单元格的背景颜色
            // shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12.0), // 使其成为椭圆形
          ),
        ),
        calendarBuilders: CalendarBuilders(defaultBuilder: (context, date, _) {
          final text = DateFormat.d().format(date);
          return Container(
            child: Center(
              child: Container(
                width: 60,
                height: 45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text + '日',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "消费:¥1000",
                      style: TextStyle(
                        color: HexColor('#37bced'),
                        fontSize: 8,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }, selectedBuilder: (context, date, _) {
          final text = DateFormat.d().format(date);
          return Container(
            child: Center(
              child: Container(
                width: 60,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: HexColor('#7B98D1'), width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text + '日',
                      style: TextStyle(
                          color: HexColor('#7B98D1'),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "消费:¥1000",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 8,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
          ;
        }, todayBuilder: (context, date, _) {
          final text = DateFormat.d().format(date);
          return Container(
            child: Center(
              child: Container(
                width: 60,
                height: 45,
                // padding: EdgeInsets.only(top: 8, bottom: 8),
                decoration: BoxDecoration(
                  color: HexColor('#7B98D1'),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      text + '日',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "消费:¥1000",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 9,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
