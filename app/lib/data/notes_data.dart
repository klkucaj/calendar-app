import 'package:flutter/material.dart';

class NotesData {
  final ValueNotifier<DateTime> _selectedDate = ValueNotifier(DateTime.now());
  final ValueNotifier<Map<DateTime, String>> _notes = ValueNotifier({});

  ValueNotifier<DateTime> get selectedDate => _selectedDate;

  ValueNotifier<Map<DateTime, String>> get notes => _notes;

  String get selectedDateNotes => _getDateNotes(_selectedDate.value);

  void selectDate(DateTime value) {
    _selectedDate.value = value;
  }

  void updateNotes(String value) {
    final Map<DateTime, String> temp = _notes.value;
    temp[_selectedDate.value] = value;
    _notes.value = temp;
  }

  bool hasNotes(DateTime date) => _getDateNotes(date).isNotEmpty;

  String _getDateNotes(DateTime date) => _notes.value[date] ?? "";
}
