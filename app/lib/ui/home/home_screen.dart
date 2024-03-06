import 'package:calendar_app/calendar/custom_calendar.dart';
import 'package:calendar_app/data/notes_data.dart';
import 'package:calendar_app/ui/home/view/notes_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotesData _data = NotesData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.3,
              padding: const EdgeInsets.all(20),
              child: NotesView(
                data: _data,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ValueListenableBuilder(
                valueListenable: _data.notes,
                builder: (context, notes, child) => CustomCalendarView(
                  initialDate: _data.selectedDate.value,
                  dateLabelStyle: Theme.of(context).textTheme.titleLarge,
                  selectedDateTextColor:
                      Theme.of(context).colorScheme.background,
                  selectedDateBackgroundColor:
                      Theme.of(context).colorScheme.primary,
                  markedBorderColor: Theme.of(context).colorScheme.primary,
                  onDateSelect: _data.selectDate,
                  shouldMarkDate: _data.hasNotes,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
