import 'package:flutter/material.dart';

// This class represents a widget for displaying a text indicating parameter setting.
class SetParameterText extends StatelessWidget {
  // Constructor for the SetParameterText widget.
  const SetParameterText({
    super.key,
  });

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    // Text widget displaying the title 'Set Parameters'.
    return Text(
      'Set Parameters',
      // Apply the titleMedium text style from the current theme.
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
