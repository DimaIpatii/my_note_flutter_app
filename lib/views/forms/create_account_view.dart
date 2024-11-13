import "package:flutter/material.dart";

import "../inputs/date_picker_view.dart";
import "../inputs/email_text_field_view.dart";
import "../inputs/text_field_view.dart";

class CreateAccountFormView extends StatefulWidget {
  const CreateAccountFormView({super.key});

  @override
  State<CreateAccountFormView> createState() => _CreateAccountFormView();
}

class _CreateAccountFormView extends State<CreateAccountFormView> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  DateTime? _dateOfBirth;

  @override
  void dispose() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _dateOfBirth = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formStateKey,
        child: Column(
          children: [
            TextFieldView(
              inputController: _firstNameController,
              isRequired: true,
              autovalidateMode: AutovalidateMode.onUnfocus,
              labelText: "First Name",
              errorMessage: "Is required",
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldView(
              inputController: _lastNameController,
              autovalidateMode: AutovalidateMode.onUnfocus,
              isRequired: true,
              labelText: "Last Name",
              errorMessage: "Is required",
            ),
            const SizedBox(
              height: 20,
            ),
            DatePickerView(
              isRequired: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onPickDate: (date) {
                setState(() {
                  _dateOfBirth = date;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            EmailTextFieldView(
              emailController: _emailController,
              isRequired: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formStateKey.currentState?.validate() == true) {
                      debugPrint("Send registration reques");
                    }
                  },
                  child: const Text("Register"),
                )
              ],
            ),
          ],
        ));
  }
}
