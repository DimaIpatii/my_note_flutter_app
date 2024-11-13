import "package:flutter/material.dart";
import "package:intl/intl.dart";

class DatePickerView extends StatefulWidget {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final bool isRequired;
  final AutovalidateMode autovalidateMode;
  final String labelText;
  final Function(DateTime? date) onPickDate;

  const DatePickerView({
    super.key,
    required this.onPickDate,
    this.isRequired = false,
    this.autovalidateMode = AutovalidateMode.onUnfocus,
    this.initialDate,
    this.firstDate,
    this.labelText = "Pick a date",
  });

  @override
  State<DatePickerView> createState() => _DatePickerView();
}

class _DatePickerView extends State<DatePickerView> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    if (widget.initialDate != null) {
      final DateTime date = widget.initialDate!;

      setState(() {
        _dateController.text = _formatDateToString(date);
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    _dateController.clear();

    super.dispose();
  }

  String _formatDateToString(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }

  String? _validator(String? value) {
    if (widget.isRequired == false) {
      return null;
    }

    if (value == null || value.isEmpty) {
      return "Select date";
    } else {
      return null;
    }
  }

  void _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(1970),
      lastDate: DateTime(2101),
    );

    setState(() {
      if (pickedDate != null) {
        _dateController.text = _formatDateToString(pickedDate);
      } else {
        _dateController.text = "";
      }
    });

    widget.onPickDate(pickedDate);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      enableInteractiveSelection: false,
      readOnly: true,
      canRequestFocus: false,
      textInputAction: TextInputAction.none,
      autovalidateMode: widget.autovalidateMode,
      validator: _validator,
      onTap: () {
        _pickDate(context);
      },
      decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          suffixIcon: const Icon(
            Icons.calendar_month,
          ),
          suffixIconColor: Theme.of(context).colorScheme.primary),
    );
  }
}
