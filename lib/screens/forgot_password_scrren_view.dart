import "package:flutter/material.dart";

import "../views/forms/forgot_password_form.dart";

class ForgotPasswordFormScreenView extends StatelessWidget {
  const ForgotPasswordFormScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text(
                "Forgot password?",
                //style: Theme.of(context).textTheme.headlineMedium,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Enter a valid email address and follow the instructions in you email inbox, in order to reset the password.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const ForgotPasswordFormView()
            ],
          ),
        ),
      ),
    );
  }
}
