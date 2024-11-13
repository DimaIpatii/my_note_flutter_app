import "package:flutter/material.dart";

class EmailTextFieldView extends StatelessWidget {
  final TextEditingController emailController;
  final String labelText;
  final bool isRequired;
  final AutovalidateMode? autovalidateMode;
  final Function(String value, bool isValid)? onChanged;
  final Function(String value, bool isValid)? onSubmitted;

  const EmailTextFieldView({
    super.key,
    required this.emailController,
    this.labelText = "Email",
    this.isRequired = false,
    this.autovalidateMode = AutovalidateMode.onUnfocus,
    this.onChanged,
    this.onSubmitted,
  });

  RegExp get _emailRegex => RegExp(r"^\S+@\S+\.\S+$");

  String? _emailValidator(String? value) {
    if (isRequired == false) {
      return null;
    }

    if (value == null || value.isEmpty) {
      return "Email required";
    } else if (_emailRegex.hasMatch(value) == false) {
      return "Invalid email";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode:
          (isRequired == true) ? autovalidateMode : AutovalidateMode.disabled,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value, _emailValidator(value) == null);
        }
      },
      onFieldSubmitted: (value) {
        if (onSubmitted != null) {
          onSubmitted!(value, _emailValidator(value) == null);
        }
      },
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      validator: _emailValidator,
    );
  }
}
