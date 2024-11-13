import "package:flutter/material.dart";

class TextFieldView extends StatelessWidget {
  final TextEditingController inputController;
  final String labelText;
  final String errorMessage;
  final bool isRequired;
  final AutovalidateMode? autovalidateMode;
  final Function(String value, bool isValid)? onChanged;
  final Function(String value, bool isValid)? onSubmitted;

  const TextFieldView({
    super.key,
    required this.inputController,
    this.labelText = "",
    this.errorMessage = "Value is required",
    this.isRequired = false,
    this.autovalidateMode,
    this.onChanged,
    this.onSubmitted,
  });

  String? _fieldValidator(String? value) {
    if (isRequired == false) {
      return null;
    }

    if (value == null || value.isEmpty) {
      return errorMessage;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      autovalidateMode:
          (isRequired == true) ? autovalidateMode : AutovalidateMode.disabled,
      validator: _fieldValidator,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value, _fieldValidator(value) != null);
        }
      },
      onFieldSubmitted: (value) {
        if (onSubmitted != null) {
          onSubmitted!(value, _fieldValidator(value) != null);
        }
      },
    );
  }
}
