import "package:flutter/material.dart";

class ScreenScaffoldWrapper extends StatelessWidget {
  final List<Widget> children;

  const ScreenScaffoldWrapper({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
