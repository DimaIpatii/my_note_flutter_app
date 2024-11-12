import "package:flutter/material.dart";

// CUSTOM VIEWS
import '../inputs/email_text_field_view.dart';
import '../inputs/password_field_view.dart';

class LogInFormView extends StatefulWidget {
  const LogInFormView({super.key});

  @override
  State<LogInFormView> createState() => _LogInFormView();
}

class _LogInFormView extends State<LogInFormView> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formStateKey,
      child: Column(
        children: [
          EmailTextFieldView(
            emailController: _emailController,
            isRequired: true,
          ),
          const SizedBox(
            height: 20,
          ),
          PasswordFieldView(
            passwordController: _passwordController,
            isRequired: true,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              _formStateKey.currentState!.validate();
            },
            child: const Text("Log in"),
          )
        ],
      ),
    );
  }
}
