import "package:flutter/material.dart";

class SectionTitleView extends StatelessWidget {
  final String text;

  const SectionTitleView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }
}
