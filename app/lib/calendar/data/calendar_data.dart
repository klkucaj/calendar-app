import 'package:calendar_app/calendar/data/uiitem/calendar_uiitem.dart';
import 'package:calendar_app/calendar/extensions/datetime_extension.dart';
import 'package:calendar_app/calendar/extensions/list_extension.dart';
import 'package:flutter/material.dart';

typedef OnDateSelect = void Function(DateTime);

class CalendarData {
  final int _firstDayOfWeekIndex;
  final ValueNotifier<DateTime> _month;
  final ValueNotifier<DateTime> _date;
  final ValueNotifier<List<List<CalendarUiItem>>> _dates = ValueNotifier([]);
  final List<String> _daysLabels;
  final OnDateSelect? onSelectDate;

  CalendarData({
    DateTime? initialDate,
    required int firstDayOfWeekIndex,
    required List<String> narrowWeekdays,
    required this.onSelectDate,
  })  : _firstDayOfWeekIndex = firstDayOfWeekIndex,
        _daysLabels = narrowWeekdays,
        _date = ValueNotifier(initialDate ?? DateTime.now()),
        _month = ValueNotifier(DateTime.now()) {
    _loadCalendarDates();
  }

  ValueNotifier<DateTime> get monthNotifier => _month;

  ValueNotifier<DateTime> get dateNotifier => _date;

  ValueNotifier<List<List<CalendarUiItem>>> get datesNotifier => _dates;

  List<String> get daysLabels => _daysLabels;

  void onDateSelect(DateTime date) {
    if (_date.value.month != date.month) {
      _month.value = _month.value.copyWith(
        month: date.month,
      );
      _loadCalendarDates();
    }
    _date.value = date;
    onSelectDate?.call(date);
  }

  void prevMonth() {
    _month.value = _month.value.addMonth(-1);
    _loadCalendarDates();
  }

  void nextMonth() {
    _month.value = _month.value.addMonth(1);
    _loadCalendarDates();
  }

  DateTime _getFirstDayOfFirstMonthWeek() {
    final DateTime firstDayOfMonth = _month.value.firstDayOfMonth;
    final int weekDay = firstDayOfMonth.weekday;
    final DateTime firstDay = firstDayOfMonth.subtract(
      Duration(
        days: weekDay - _firstDayOfWeekIndex,
      ),
    );
    return firstDay.withoutTime;
  }

  DateTime _getLastDayOfLastMonthWeek() {
    final DateTime lastDayOfMonth = _month.value.lastDayOfMonth;
    final int weekDay = lastDayOfMonth.weekday;
    final DateTime lastDay = lastDayOfMonth.add(
      Duration(
        days: (_firstDayOfWeekIndex == 0 ? 6 : 7) - weekDay,
      ),
    );
    return lastDay.withoutTime;
  }

  void _loadCalendarDates() {
    final DateTime firstDay = _getFirstDayOfFirstMonthWeek();
    final DateTime lastDay = _getLastDayOfLastMonthWeek();
    final List<CalendarUiItem> dates = [];

    DateTime temp = firstDay;
    do {
      final CalendarUiItem item = CalendarUiItem(
        date: temp,
        currentMonthDay: _month.value.sameMonth(temp),
      );
      dates.add(item);
      temp = temp.add(const Duration(days: 1));
    } while (!temp.isAfter(lastDay));

    _dates.value = dates.splitInSubLists(7);
  }
}
