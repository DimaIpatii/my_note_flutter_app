import "package:flutter/material.dart";

import "../inputs/email_text_field_view.dart";

class ForgotPasswordFormView extends StatefulWidget {
  const ForgotPasswordFormView({super.key});

  @override
  State<ForgotPasswordFormView> createState() => _ForgotPasswordFormView();
}

class _ForgotPasswordFormView extends State<ForgotPasswordFormView> {
  bool _isSendRequestDisable = true;

  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _globalFormKey,
        child: Column(
          children: [
            EmailTextFieldView(
              emailController: _emailController,
              isRequired: true,
              onChanged: (value, isValid) {
                setState(() {
                  _isSendRequestDisable = !isValid;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _isSendRequestDisable
                  ? null
                  : () {
                      _globalFormKey.currentState?.validate();
                    },
              child: const Text("Send request"),
            )
          ],
        ));
  }
}
