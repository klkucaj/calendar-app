import 'package:calendar_app/data/notes_data.dart';
import 'package:flutter/material.dart';

class NotesView extends StatefulWidget {
  final NotesData data;

  const NotesView({
    super.key,
    required this.data,
  });

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.data.selectedDate.addListener(_onDateChange);
    _focusNode.addListener(_onNoteFocus);
  }

  @override
  void dispose() {
    widget.data.selectedDate.removeListener(_onDateChange);
    _focusNode.removeListener(_onNoteFocus);
    super.dispose();
  }

  void _onDateChange() {
    _textController.text = widget.data.selectedDateNotes;
    _focusNode.unfocus();
  }

  void _onNoteFocus() {
    if (_focusNode.hasFocus) return;
    final String value = _textController.text;
    widget.data.updateNotes(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: _textController,
        focusNode: _focusNode,
        maxLines: 10,
        cursorColor: Theme.of(context).colorScheme.background,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.background,
            ),
        decoration: InputDecoration(
          hintText: "notes..",
          contentPadding: const EdgeInsets.all(10),
          hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                color:
                    Theme.of(context).colorScheme.background.withOpacity(0.5),
              ),
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
