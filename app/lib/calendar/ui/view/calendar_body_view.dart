import 'package:calendar_app/calendar/custom_calendar.dart';
import 'package:calendar_app/calendar/extensions/iterable_extension.dart';
import 'package:calendar_app/calendar/ui/view/calendar_date_view.dart';
import 'package:flutter/material.dart';

class CalendarBodyView extends StatelessWidget {
  final TextStyle? dateLabelStyle;
  final Color? selectedDateTextColor;
  final Color? selectedDateBackgroundColor;
  final Color? markedBorderColor;
  final ShouldMarkDate? shouldMarkDate;

  const CalendarBodyView({
    super.key,
    this.selectedDateTextColor,
    this.selectedDateBackgroundColor,
    this.markedBorderColor,
    this.dateLabelStyle,
    this.shouldMarkDate,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CustomCalendar.of(context).datesNotifier,
      builder: (context, dates, child) => Column(
        mainAxisSize: MainAxisSize.min,
        children: dates.mapList(
          (item) => Row(
            children: item.mapList(
              (item) => Expanded(
                child: CalendarDateView(
                  item: item,
                  labelStyle: dateLabelStyle ??
                      Theme.of(context).textTheme.titleLarge,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  selectedTextColor: selectedDateTextColor ??
                      Theme.of(context).colorScheme.background,
                  selectedBackgroundColor: selectedDateBackgroundColor ??
                      Theme.of(context).colorScheme.primary,
                  markedBorderColor:
                      markedBorderColor ?? Theme.of(context).colorScheme.primary,
                  shouldMarkDate: shouldMarkDate,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
