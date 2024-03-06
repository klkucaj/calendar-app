import 'package:calendar_app/calendar/extensions/datetime_extension.dart';
import 'package:calendar_app/calendar/extensions/iterable_extension.dart';
import 'package:calendar_app/calendar/ui/custom_calendar_view.dart';
import 'package:flutter/material.dart';

class CalendarHeaderView extends StatelessWidget {
  const CalendarHeaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = CustomCalendar.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueListenableBuilder(
          valueListenable: data.monthNotifier,
          builder: (context, date, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: data.prevMonth,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                  ),
                ),
              ),
              Text(
                "${date.monthName} ${date.year}",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              GestureDetector(
                onTap: data.nextMonth,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: data.daysLabels.mapList(
              (item) => Expanded(
                child: Center(
                  child: Text(
                    item,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
