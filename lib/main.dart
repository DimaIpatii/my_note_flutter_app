import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_note/model/manage_password_screen_option.dart';
import 'package:my_note/screens/manage_password_screen_view.dart';
import 'package:my_note/views/inputs/password_field_view.dart';
import 'screens/forgot_password_scrren_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const ManagePasswordScreenView(
        type: ManagePasswordScreenOption.update,
      ),
    );
  }
}
