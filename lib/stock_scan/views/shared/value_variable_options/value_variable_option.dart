import 'package:flutter/material.dart';
import '../widgets/dotted_border.dart';

// This class represents a widget for displaying an option value in a value variable.
class ValueVariableOption extends StatelessWidget {
  // Constructor for the ValueVariableOption widget.
  const ValueVariableOption({
    super.key,
    required this.valueIndex,
    required this.optionValue,
  });

  // The index of the value option.
  final int valueIndex;

  // The value of the option to be displayed.
  final String optionValue;

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    // CustomPaint widget to draw a dotted border around the option.
    return CustomPaint(
      painter: DottedBorderPainter(),
      // Padding around the option value text.
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 0.05 * MediaQuery.of(context).size.width,
        ),
        // Text widget displaying the option value.
        child: Text(
          optionValue,
          // Apply the titleMedium text style from the current theme.
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
