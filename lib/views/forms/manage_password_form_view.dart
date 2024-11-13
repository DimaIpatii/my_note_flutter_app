import "dart:async";

import "package:flutter/material.dart";

import "../../model/manage_password_screen_option.dart";
import "../inputs/password_field_view.dart";

class ManagePasswordFormView extends StatefulWidget {
  final ManagePasswordScreenOption type;
  const ManagePasswordFormView({super.key, required this.type});

  @override
  State<ManagePasswordFormView> createState() => _ManagePasswordFormView();
}

class _ManagePasswordFormView extends State<ManagePasswordFormView> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newPasswordRepeatController =
      TextEditingController();

  bool _allFieldsValid = false;
  Timer? _debounce;

  @override
  void dispose() {
    _oldPasswordController.clear();
    _newPasswordController.clear();
    _newPasswordRepeatController.clear();
    _debounce?.cancel();
    super.dispose();
  }

  String? _oldPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password required";
    } else {
      return null;
    }
  }

  String? _newPasswordValidator(String? value) {
    final oldPassword = _oldPasswordController.text;

    if (value == null || value.isEmpty) {
      return "Password required";
    } else if (widget.type == ManagePasswordScreenOption.update &&
        oldPassword == value) {
      return "Password must be different from the old";
    } else {
      return null;
    }
  }

  String? _newPasswordRepeatValidator(String? value) {
    final newPassword = _newPasswordController.text;

    if (_newPasswordValidator(value) != null) {
      return _newPasswordValidator(value);
    } else if (newPassword != value) {
      return "Password repeat must be the same as the password";
    } else {
      return null;
    }
  }

  void _onFieldChange() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _allFieldsValidCheck();
    });
  }

  void _allFieldsValidCheck() {
    final String oldPassword = _oldPasswordController.text;
    final String newPassword = _newPasswordController.text;
    final String newPasswordRepeat = _newPasswordRepeatController.text;

    final bool isOldPasswordValid = _oldPasswordValidator(oldPassword) == null;
    final bool isNewPasswordvalid = _newPasswordValidator(newPassword) == null;
    final bool isNewPasswordRepeatValid =
        _newPasswordRepeatValidator(newPasswordRepeat) == null;

    setState(
      () {
        if (widget.type == ManagePasswordScreenOption.update) {
          _allFieldsValid = isOldPasswordValid &&
              isNewPasswordvalid &&
              isNewPasswordRepeatValid;
        } else {
          _allFieldsValid = isNewPasswordvalid && isNewPasswordRepeatValid;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        if (widget.type == ManagePasswordScreenOption.update)
          PasswordFieldView(
            passwordController: _oldPasswordController,
            isRequired: true,
            labelText: "Old password",
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: _oldPasswordValidator,
            onChanged: (value, isValid) {
              _onFieldChange();
            },
          ),
        const SizedBox(
          height: 20,
        ),
        PasswordFieldView(
          passwordController: _newPasswordController,
          isRequired: true,
          labelText: "Password",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: _newPasswordValidator,
          onChanged: (value, isValid) {
            _onFieldChange();
          },
        ),
        const SizedBox(
          height: 20,
        ),
        PasswordFieldView(
          passwordController: _newPasswordRepeatController,
          isRequired: true,
          labelText: "Password repeat",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: _newPasswordRepeatValidator,
          onChanged: (value, isValid) {
            _onFieldChange();
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _allFieldsValid ? () {} : null,
              child: const Text("Send request"),
            )
          ],
        ),
      ],
    ));
  }
}
