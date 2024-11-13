import "package:flutter/material.dart";
import "package:my_note/views/forms/log_in_form_view.dart";
import "package:my_note/views/screen_scaffold_wrapper.dart";
import "package:my_note/views/titles/section_title_view.dart";

class LogInScreenView extends StatefulWidget {
  const LogInScreenView({super.key});

  @override
  State<LogInScreenView> createState() => _LogInScreenViewState();
}

class _LogInScreenViewState extends State<LogInScreenView> {
  @override
  Widget build(BuildContext context) {
    return ScreenScaffoldWrapper(children: [
      const SectionTitleView(text: "Log In"),
      const SizedBox(
        height: 20,
      ),
      const LogInFormView(),
      const SizedBox(
        height: 20,
      ),
      TextButton(onPressed: () {}, child: const Text("Forgot password?"))
    ]);
  }
}
