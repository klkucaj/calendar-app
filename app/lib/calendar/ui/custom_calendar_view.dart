import 'package:calendar_app/calendar/data/calendar_data.dart';
import 'package:calendar_app/calendar/ui/view/calendar_body_view.dart';
import 'package:calendar_app/calendar/ui/view/calendar_date_view.dart';
import 'package:calendar_app/calendar/ui/view/calendar_header_view.dart';
import 'package:flutter/material.dart';

class CustomCalendar extends InheritedWidget {
  final CalendarData data;

  const CustomCalendar({
    super.key,
    required this.data,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant CustomCalendar oldWidget) =>
      oldWidget.data != data;

  static CalendarData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CustomCalendar>()!.data;
  }
}

class CustomCalendarView extends StatelessWidget {
  final DateTime? initialDate;
  final TextStyle? dateLabelStyle;
  final Color? selectedDateTextColor;
  final Color? selectedDateBackgroundColor;
  final Color? markedBorderColor;
  final OnDateSelect? onDateSelect;
  final ShouldMarkDate? shouldMarkDate;

  const CustomCalendarView({
    super.key,
    this.initialDate,
    this.selectedDateTextColor,
    this.selectedDateBackgroundColor,
    this.markedBorderColor,
    this.dateLabelStyle,
    this.onDateSelect,
    this.shouldMarkDate,
  });

  @override
  Widget build(BuildContext context) {
    final data = MaterialLocalizations.of(context);
    return CustomCalendar(
      data: CalendarData(
        initialDate: initialDate,
        firstDayOfWeekIndex: data.firstDayOfWeekIndex,
        narrowWeekdays: data.narrowWeekdays,
        onSelectDate: onDateSelect,
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CalendarHeaderView(),
            const SizedBox(height: 20),
            CalendarBodyView(
              dateLabelStyle: dateLabelStyle,
              selectedDateTextColor: selectedDateTextColor,
              selectedDateBackgroundColor: selectedDateBackgroundColor,
              markedBorderColor: markedBorderColor,
              shouldMarkDate: shouldMarkDate,
            ),
          ],
        ),
      ),
    );
  }
}
