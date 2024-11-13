import "package:flutter/material.dart";
import "package:my_note/views/screen_scaffold_wrapper.dart";

import "../views/forms/forgot_password_form.dart";
import "../views/titles/section_title_view.dart";

class ForgotPasswordFormScreenView extends StatelessWidget {
  const ForgotPasswordFormScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenScaffoldWrapper(children: [
      const SectionTitleView(text: "Forgot password?"),
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
    ]);
  }
}
