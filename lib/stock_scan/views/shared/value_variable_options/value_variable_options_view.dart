import 'package:flutter/material.dart';

import '../../../models/variables/value_variable_model.dart';
import 'value_variable_option.dart';

// This class represents a view for displaying options of a Value Variable.
class ValueVariableViewOptionsView extends StatelessWidget {
  // Constructor for the ValueVariableViewOptionsView.
  const ValueVariableViewOptionsView({
    super.key,
    required this.valueVariable,
  });

  // The ValueVariableModel containing options to be displayed.
  final ValueModel valueVariable;

  // Helper method to get the formatted value of an option.
  String _optionValue(List<double> sortedValues, int index) {
    double firstValue = sortedValues[index];
    // Check if the value has decimal places.
    String optionValue = firstValue == firstValue.truncateToDouble()
        ? firstValue.toStringAsFixed(0) // Render fraction digits when not zero.
        : firstValue.toString();
    return optionValue;
  }

  // Build method for the widget.
  @override
  Widget build(BuildContext context) {
    List<double> values = <double>[...?valueVariable.values];
    values.sort();
    final sortedValues = values;
    // Scaffold widget for the overall structure of the view.
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.05 * MediaQuery.of(context).size.width,
          vertical: 0.05 * MediaQuery.of(context).size.height,
        ),
        // ListView.builder for dynamically displaying options.
        child: ListView.builder(
          itemCount: sortedValues.length,
          // ItemBuilder for creating ValueVariableOption widgets for each option.
          itemBuilder: (context, index) => ValueVariableOption(
            valueIndex: valueVariable.values!.indexOf(sortedValues[index]),
            optionValue: _optionValue(sortedValues, index),
          ),
        ),
      ),
    );
  }
}
