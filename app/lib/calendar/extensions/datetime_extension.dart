List<String> _monthNames = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

extension DateTimeExt on DateTime {
  DateTime get firstDayOfMonth {
    return DateTime(
      year,
      month,
      1,
    );
  }

  DateTime get lastDayOfMonth {
    return DateTime(
      year,
      month + 1,
      0,
    );
  }

  DateTime get withoutTime {
    return DateTime(
      year,
      month,
      day,
    );
  }

  bool sameMonth(
    DateTime other,
  ) {
    return other.year == year && other.month == month;
  }

  bool sameDate(
    DateTime other,
  ) {
    return other.year == year && other.month == month && other.day == day;
  }

  String get monthName => _monthNames[month - 1];

  DateTime addMonth(int value) {
    return copyWith(
      month: month + value,
    );
  }
}
