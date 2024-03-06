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
  final TextEditingController _controller = TextEditingController();
  final FocusNode _node = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.data.selectedDate.addListener(_onDateChange);
      _node.addListener(_onNoteFocus);
    });
  }

  @override
  void dispose() {
    widget.data.selectedDate.removeListener(_onDateChange);
    _node.removeListener(_onNoteFocus);
    super.dispose();
  }

  void _onDateChange() {
    _controller.text = widget.data.selectedDateNotes;
    _node.unfocus();
  }

  void _onNoteFocus() {
    if (_node.hasFocus) return;
    final String value = _controller.text;
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
        controller: _controller,
        focusNode: _node,
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
