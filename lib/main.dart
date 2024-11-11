import 'package:flutter/material.dart';

import 'views/inputs/email_text_field_view.dart';
import 'views/inputs/password_field_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const LogInScreenView(),
    );
  }
}

class LogInScreenView extends StatefulWidget {
  const LogInScreenView({super.key});

  @override
  State<LogInScreenView> createState() => _LogInScreenViewState();
}

class _LogInScreenViewState extends State<LogInScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text(
                "Log In",
                //style: Theme.of(context).textTheme.headlineMedium,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              const LogInFormView(),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {}, child: const Text("Forgot password?"))
            ],
          ),
        ),
      ),
    );
  }
}

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

class ForgotPasswordFormView extends StatefulWidget {
  const ForgotPasswordFormView({super.key});

  @override
  State<ForgotPasswordFormView> createState() => _ForgotPasswordFormView();
}

class _ForgotPasswordFormView extends State<ForgotPasswordFormView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
