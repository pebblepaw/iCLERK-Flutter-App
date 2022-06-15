import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class calendarPage extends StatefulWidget {
  @override
  _calendarPageState createState() => _calendarPageState();
}

class _calendarPageState extends State<calendarPage> {

  @override
  Widget build(BuildContext context) {
    return Container(

          child: SfCalendar(
      view:CalendarView.month)
        );
  }
}