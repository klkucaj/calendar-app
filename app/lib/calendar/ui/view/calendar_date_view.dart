import 'package:calendar_app/calendar/custom_calendar.dart';
import 'package:calendar_app/calendar/data/uiitem/calendar_uiitem.dart';
import 'package:calendar_app/calendar/extensions/datetime_extension.dart';
import 'package:flutter/material.dart';

typedef ShouldMarkDate = bool Function(DateTime);

class CalendarDateView extends StatelessWidget {
  final CalendarUiItem item;
  final TextStyle? labelStyle;
  final Color backgroundColor;
  final Color selectedTextColor;
  final Color selectedBackgroundColor;
  final Color markedBorderColor;
  final ShouldMarkDate? shouldMarkDate;

  const CalendarDateView({
    super.key,
    required this.item,
    required this.labelStyle,
    required this.backgroundColor,
    required this.selectedTextColor,
    required this.selectedBackgroundColor,
    required this.markedBorderColor,
    required this.shouldMarkDate,
  });

  Decoration _dateDecoration(
    bool isSelected,
  ) {
    if (isSelected) {
      return BoxDecoration(
        color: selectedBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      );
    }
    final bool shouldMark = shouldMarkDate?.call(item.date) ?? false;
    return BoxDecoration(
      color: backgroundColor,
      shape: shouldMark ? BoxShape.circle : BoxShape.rectangle,
      border: Border.all(
        color: shouldMark
            ? markedBorderColor.withOpacity(
                item.currentMonthDay ? 1.0 : 0.5,
              )
            : Colors.transparent,
        width: shouldMark ? 2 : 0,
      ),
    );
  }

  Widget _dateView(
    bool isSelected,
  ) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: _dateDecoration(
        isSelected,
      ),
      child: Text(
        "${item.date.day}",
        style: labelStyle?.copyWith(
          fontWeight: FontWeight.bold,
          color: !item.currentMonthDay
              ? labelStyle?.color?.withOpacity(0.4)
              : isSelected
                  ? selectedTextColor
                  : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = CustomCalendar.of(context);
    return ValueListenableBuilder(
      valueListenable: data.dateNotifier,
      builder: (context, date, child) => GestureDetector(
        onTap: () => data.onDateSelect(item.date),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Center(
            child: _dateView(
              date.sameDate(item.date),
            ),
          ),
        ),
      ),
    );
  }
}
