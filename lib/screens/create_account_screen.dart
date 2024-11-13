import "package:flutter/material.dart";

import "../views/forms/create_account_view.dart";
import "../views/screen_scaffold_wrapper.dart";
import "../views/titles/section_title_view.dart";

class CreateAccountScreenView extends StatelessWidget {
  const CreateAccountScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenScaffoldWrapper(
      children: [
        SectionTitleView(text: "Create account"),
        SizedBox(
          height: 20,
        ),
        CreateAccountFormView()
      ],
    );
  }
}
