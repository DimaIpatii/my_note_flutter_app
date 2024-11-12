import "package:flutter/material.dart";

class PasswordFieldView extends StatefulWidget {
  final TextEditingController passwordController;
  final String hintText;
  final bool isRequired;
  final AutovalidateMode? autovalidateMode;
  final Function(String value, bool isValid)? onChanged;
  final Function(String value, bool isValid)? onSubmitted;

  const PasswordFieldView({
    super.key,
    required this.passwordController,
    this.hintText = "Password",
    this.isRequired = false,
    this.autovalidateMode = AutovalidateMode.onUnfocus,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  State<PasswordFieldView> createState() => _PasswordFieldView();
}

class _PasswordFieldView extends State<PasswordFieldView> {
  bool _obscureText = true;

  String? _passwordValidator(String? value) {
    if (widget.isRequired == false) {
      return null;
    }

    if (value == null || value.isEmpty) {
      return "Password required";
    } else {
      return null;
    }
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      keyboardType: TextInputType.visiblePassword,
      autovalidateMode: widget.isRequired
          ? widget.autovalidateMode
          : AutovalidateMode.disabled,
      obscureText: _obscureText,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          suffixIcon: IconButton(
            onPressed: _toggleObscure,
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          )),
      validator: _passwordValidator,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value, _passwordValidator(value) == null);
        }
      },
      onFieldSubmitted: (value) {
        if (widget.onSubmitted != null) {
          widget.onSubmitted!(value, _passwordValidator(value) == null);
        }
      },
    );
  }
}
