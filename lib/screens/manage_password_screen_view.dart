import "package:flutter/material.dart";
import "package:my_note/views/screen_scaffold_wrapper.dart";

import "../model/manage_password_screen_option.dart";
import "../views/forms/manage_password_form_view.dart";
import "../views/titles/section_title_view.dart";

class ManagePasswordScreenView extends StatelessWidget {
  final ManagePasswordScreenOption type;
  const ManagePasswordScreenView(
      {super.key, this.type = ManagePasswordScreenOption.create});

  @override
  Widget build(BuildContext context) {
    return ScreenScaffoldWrapper(children: [
      SectionTitleView(
          text: type == ManagePasswordScreenOption.create
              ? "Create new password"
              : "Update password"),
      const SizedBox(
        height: 20,
      ),
      ManagePasswordFormView(
        type: type,
      )
    ]);
  }
}
