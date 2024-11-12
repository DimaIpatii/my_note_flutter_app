import "package:flutter/material.dart";
import "package:my_note/views/forms/log_in_form_view.dart";

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
