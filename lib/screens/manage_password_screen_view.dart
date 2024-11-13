import "package:flutter/material.dart";

import "../model/manage_password_screen_option.dart";
import "../views/forms/manage_password_form_view.dart";

class ManagePasswordScreenView extends StatelessWidget {
  final ManagePasswordScreenOption type;
  const ManagePasswordScreenView(
      {super.key, this.type = ManagePasswordScreenOption.create});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text(
                type == ManagePasswordScreenOption.create
                    ? "Create new password"
                    : "Update password",
                //style: Theme.of(context).textTheme.headlineMedium,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              ManagePasswordFormView(
                type: type,
              )
            ],
          ),
        ),
      ),
    );
  }
}
