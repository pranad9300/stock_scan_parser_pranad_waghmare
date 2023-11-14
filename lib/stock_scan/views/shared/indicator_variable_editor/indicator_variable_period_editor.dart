import 'package:flutter/material.dart';
import '../../../models/variables/indicator_variable_model.dart';
import 'indicator_variable_text_field.dart';

// This class represents a widget for editing the period of an Indicator Variable.
class IndicatorVariablePeriodEditor extends StatelessWidget {
  // Constructor for the IndicatorVariablePeriodEditor.
  const IndicatorVariablePeriodEditor({
    super.key,
    required this.indicatorVariable,
  });

  // The IndicatorVariableModel that is being edited.
  final IndicatorVariableModel indicatorVariable;

  // Helper method to get the formatted default value.
  String _defaultValue() {
    double firstValue = indicatorVariable.defaultValue;
    // Check if the default value has decimal places.
    String optionValue = firstValue == firstValue.truncateToDouble()
        ? firstValue.toStringAsFixed(0) // Render fraction digits when not zero.
        : firstValue.toString();
    return optionValue;
  }

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    // Container widget for the overall structure of the period editor.
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 0.02 * MediaQuery.of(context).size.width,
        vertical: 0.01 * MediaQuery.of(context).size.height,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      // Row for horizontal arrangement of widgets.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text widget displaying the label 'Period'.
          const Text(
            'Period',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          // Widget for inputting the period value.
          IndicatorVariableInput(
            defaultValue: _defaultValue(),
          ),
        ],
      ),
    );
  }
}
