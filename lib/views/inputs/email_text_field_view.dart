import "package:flutter/material.dart";

class EmailTextFieldView extends StatelessWidget {
  final TextEditingController emailController;
  final String hintText;
  final bool isRequired;
  final AutovalidateMode? autovalidateMode;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const EmailTextFieldView({
    super.key,
    required this.emailController,
    this.hintText = "Email",
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
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      validator: _emailValidator,
    );
  }
}
